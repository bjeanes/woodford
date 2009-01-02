# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def charging_time_or_form(phone)
    if phone.charging?
      h(phone.charging_at)
    else
      # link_to("Start", charge_phone_path(phone), :method => :put)
      %Q{
        <form method="post" action="#{charge_phone_path(phone)}">
          <input type="hidden" name="#{request_forgery_protection_token}"
            value="#{form_authenticity_token}" size="4" />
          <input type="hidden" name="_method" value="put" />
          <input type="text" name="phone[location]" size="4" value="#{phone.location}" />
          <input type="submit" value="Start" />
        </form>
      }
    end
  end
  
  def charged_time_or_link(phone)
    phone.charged? ? 
      h(phone.charged_at) :
      link_to("Finish", take_off_phone_path(phone), :method => :put)
  end
  
  def picked_up_time_or_link(phone)
    phone.picked_up? ?
      h(phone.picked_up_at) :
      link_to("Pick up", pick_up_phone_path(phone), :method => :put)
  end
end
