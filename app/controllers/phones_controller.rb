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

  # GET /phones/1
  # GET /phones/1.xml
  def show
    @phone = Phone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/1/edit
  def edit
    @phone = Phone.find(params[:id])
  end

  # POST /phones
  # POST /phones.xml
  def create
    @phone = Phone.new(params[:phone])
    @phone.charging! if params[:charging]

    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Phone was successfully added.'
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        get_phones
        format.html { render :action => "index" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phones/1
  # PUT /phones/1.xml
  def update
    @phone = Phone.find(params[:id])

    respond_to do |format|
      if @phone.update_attributes(params[:phone])
        flash[:notice] = 'Phone was successfully updated.'
        format.html { redirect_to(@phone) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.xml
  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to(phones_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def get_phones
    @phones = Phone.find(:all)    
  end
end
