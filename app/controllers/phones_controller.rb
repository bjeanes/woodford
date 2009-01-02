class PhonesController < ApplicationController
  # GET /phones
  # GET /phones.xml
  def index
    @phone = Phone.new
    get_phones

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end
  
  # POST /phones
  # POST /phones.xml
  def create
    @phone = Phone.new(params[:phone])
    @phone.charge! if params[:charging]

    respond_to do |format|
      if @phone.save
        flash[:notice] = "Phone ##{@phone.ticket_number} was successfully added."
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        get_phones
        format.html { render :action => "index" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  %w{charge take_off pick_up}.each do |action|
    define_method action do
      @phone = Phone.find(params[:id])
      @phone.update_attributes!(params[:phone])
      @phone.send("#{action}!")
      if @phone.save
        redirect_to :action => :index
      else
        get_phones
        render :action => :index
      end
    end
  end

  def charge
    @phone = Phone.find(params[:id])
    @phone.charge!
    if @phone.save
      redirect_to :action => :index
    else
      get_phones
      render :action => :index
    end
  end

  protected
  def get_phones
    @phones = Phone.find(:all)    
  end
end
