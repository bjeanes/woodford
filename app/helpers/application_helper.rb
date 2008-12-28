# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def charging_time_or_link(phone)
    phone.charging? ? h(phone.charging_at) : link_to("Put on charge", phone_path(phone), :method => :put)
  end
end
