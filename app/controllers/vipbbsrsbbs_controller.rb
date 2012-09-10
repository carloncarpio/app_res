class VipbbsrsbbsController < ApplicationController
  # GET /vipbbsrsbbs
  # GET /vipbbsrsbbs.json
  def index
    @vipbbsrsbbs = Vipbbsrsbb.all
    @vipbbsrsbbs = Vipbbsrsbb.where(:section => 'A').order("id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vipbbsrsbbs }
    end
  end

  def index_b
    @vipbbsrsbbs = Vipbbsrsbb.where(:section => 'B').order("id")
  end
  def index_c
    @vipbbsrsbbs = Vipbbsrsbb.where(:section => 'C').order("id")
  end
  def index_d
    @vipbbsrsbbs = Vipbbsrsbb.where(:section => 'D').order("id")
  end
  def index_e
    @vipbbsrsbbs = Vipbbsrsbb.where(:section => 'E').order("id")
    #@vipbbsrsbbs = Vipbbsrsbb.all
  end

  # GET /vipbbsrsbbs/1
  # GET /vipbbsrsbbs/1.json
  def show
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vipbbsrsbb }
    end
  end

  # GET /vipbbsrsbbs/new
  # GET /vipbbsrsbbs/new.json
  def new
    @vipbbsrsbb = Vipbbsrsbb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vipbbsrsbb }
    end
  end

  # GET /vipbbsrsbbs/1/edit
  def edit
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
  end

  # POST /vipbbsrsbbs
  # POST /vipbbsrsbbs.json
  def create
    @vipbbsrsbb = Vipbbsrsbb.new(params[:vipbbsrsbb])

    respond_to do |format|
      if @vipbbsrsbb.save
        format.html { redirect_to :action => 'index' }
        #format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully created.' }
        format.json { render json: @vipbbsrsbb, status: :created, location: @vipbbsrsbb }
      else
        format.html { render action: "new" }
        format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vipbbsrsbbs/1
  # PUT /vipbbsrsbbs/1.json
  def update
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])

    respond_to do |format|
      if @vipbbsrsbb.update_attributes(params[:vipbbsrsbb])
        format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vipbbsrsbbs/1
  # DELETE /vipbbsrsbbs/1.json
  def destroy
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
    @vipbbsrsbb.destroy

    respond_to do |format|
      format.html { redirect_to vipbbsrsbbs_url }
      #format.json { head :no_content }
      format.js 
    end
  end

  def visual
    @vipbbsrsbbs_a = Vipbbsrsbb.find_section('A').order("id")
    @vipbbsrsbbs_b = Vipbbsrsbb.find_section('B').order("id")
    @vipbbsrsbbs_c = Vipbbsrsbb.find_section('C').order("id")
    @vipbbsrsbbs_d = Vipbbsrsbb.find_section('D').order("id")
    @vipbbsrsbbs_e = Vipbbsrsbb.find_section('E').order("id")

    @vipbbsrsbbs_with = Vipbbsrsbb.where(:status => true).order("id")
    @vipbbsrsbbs = Vipbbsrsbb.all
    @my_vipbbsrsbbs = Vipbbsrsbb.find_reserve(session[:company_name]).order("id")

    @vipbbsrsbbs_total = Vipbbsrsbb.total_approved('yes').size
    @vipbbsrsbbs_pending = Vipbbsrsbb.total_pending('no',true).size
  end

  def update_status
     @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
     @vipbbsrsbb.update_attribute :approved, 'no'
     @vipbbsrsbb.update_attribute :paid, 'no'
     respond_to do |format|
      if @vipbbsrsbb.status == false
        if @vipbbsrsbb.update_attribute :status, true
           @vipbbsrsbb.update_attribute :company_name, session[:company_name]
           @vipbbsrsbb.update_attribute :company_contact, session[:company_contact]
           @vipbbsrsbb.update_attribute :company_email, session[:company_email]
           @vipbbsrsbb.update_attribute :user_id, session[:id]
          #format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
        end
      else
        if @vipbbsrsbb.update_attribute :status, false
           @vipbbsrsbb.update_attribute :company_name, nil
           @vipbbsrsbb.update_attribute :company_contact, nil
           @vipbbsrsbb.update_attribute :company_email, nil
           @vipbbsrsbb.update_attribute :user_id, nil
          #format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def logout
    session[:username] = nil
    session[:id] = nil
    session[:company_name] = nil
    session[:company_email] = nil
    session[:company_contact] = nil
    redirect_to :controller => 'access', :action => 'index'
  end

  def my_reserve
    @my_vipbbsrsbbs = Vipbbsrsbb.where(:company_name => session[:company_name])
  end

  def approved
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
    @vipbbsrsbb.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@vipbbsrsbb.company_email,@vipbbsrsbb.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
     @vipbbsrsbb.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
     @vipbbsrsbb.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
     @vipbbsrsbb.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  

end
