class SrsbvipbsController < ApplicationController
  before_filter :confirm_logged_in
  # GET /srsbvipbs
  # GET /srsbvipbs.json
  def index
    @srsbvipbs = Srsbvipb.all
    @srsbvipbs = Srsbvipb.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @srsbvipbs }
    end
  end
  def index_b
    @srsbvipbs = Srsbvipb.where(:section => 'B').order("id")
  end
  def index_c
    @srsbvipbs = Srsbvipb.where(:section => 'C').order("id")
  end
  def index_d
    @srsbvipbs = Srsbvipb.where(:section => 'D').order("id")
  end
  def index_e
    @srsbvipbs = Srsbvipb.where(:section => 'E').order("id")
  end
  def index_f
    @srsbvipbs = Srsbvipb.where(:section => 'F').order("id")
  end

  # GET /srsbvipbs/1
  # GET /srsbvipbs/1.json
  def show
    @srsbvipb = Srsbvipb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @srsbvipb }
    end
  end

  # GET /srsbvipbs/new
  # GET /srsbvipbs/new.json
  def new
    @srsbvipb = Srsbvipb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @srsbvipb }
    end
  end

  # GET /srsbvipbs/1/edit
  def edit
    @srsbvipb = Srsbvipb.find(params[:id])
  end

  # POST /srsbvipbs
  # POST /srsbvipbs.json
  def create
    @srsbvipb = Srsbvipb.new(params[:srsbvipb])

    respond_to do |format|
      if @srsbvipb.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @srsbvipb, status: :created, location: @srsbvipb }
      else
        format.html { render action: "new" }
        format.json { render json: @srsbvipb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /srsbvipbs/1
  # PUT /srsbvipbs/1.json
  def update
    @srsbvipb = Srsbvipb.find(params[:id])

    respond_to do |format|
      if @srsbvipb.update_attributes(params[:srsbvipb])
        format.html { redirect_to @srsbvipb, notice: 'Srsbvipb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @srsbvipb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srsbvipbs/1
  # DELETE /srsbvipbs/1.json
  def destroy
    @srsbvipb = Srsbvipb.find(params[:id])
    @srsbvipb.destroy

    respond_to do |format|
      format.html { redirect_to srsbvipbs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @srsbvipbs_a = Srsbvipb.find_section('A').order("id")
    @srsbvipbs_b = Srsbvipb.find_section('B').order("id")
    @srsbvipbs_c = Srsbvipb.find_section('C').order("id")
    @srsbvipbs_d = Srsbvipb.find_section('D').order("id")
    @srsbvipbs_e = Srsbvipb.find_section('E').order("id")
    @srsbvipbs_f = Srsbvipb.find_section('F').order("id")
    @srsbvipbs_g = Srsbvipb.find_section('G').order("id")
    @srsbvipbs_h = Srsbvipb.find_section('H').order("id")
    @srsbvipbs_i = Srsbvipb.find_section('I').order("id")
    @srsbvipbs_j = Srsbvipb.find_section('J').order("id")

    @srsbvipbs_with = Srsbvipb.where(:status => true)
    @srsbvipb = Srsbvipb.all
    @my_srsbvipb = Srsbvipb.find_reserve(session[:company_name]).order("id")

    @srsbvipbs_total = Srsbvipb.total_approved('yes').size
    @srsbvipbs_pending = Srsbvipb.total_pending('no',true).size
  end

  def update_status
     @srsbvipb = Srsbvipb.find(params[:id])
     @srsbvipb.update_attribute :approved, 'no'
     @srsbvipb.update_attribute :paid, 'no'
     respond_to do |format|
      if @srsbvipb.status == false
        if @srsbvipb.update_attribute :status, true
           @srsbvipb.update_attribute :company_name, session[:company_name]
           @srsbvipb.update_attribute :company_contact, session[:company_contact]
           @srsbvipb.update_attribute :company_email, session[:company_email]
           @srsbvipb.update_attribute :user_id, session[:id]
          #format.html { redirect_to @srsbvipba, notice: 'srsbvipba was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @srsbvipba.errors, status: :unprocessable_entity }
        end
      else
        if @srsbvipb.update_attribute :status, false
           @srsbvipb.update_attribute :company_name, nil
           @srsbvipb.update_attribute :company_contact, nil
           @srsbvipb.update_attribute :company_email, nil
           @srsbvipb.update_attribute :user_id, nil
          #format.html { redirect_to @srsbvipba, notice: 'srsbvipba was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @srsbvipba.errors, status: :unprocessable_entity }
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
    @my_srsbvipb = Srsbvipb.where(:company_name => session[:company_name])
  end

  def approved
    @srsbvipb = Srsbvipb.find(params[:id])
    @srsbvipb.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@srsbvipba.company_email,@srsbvipba.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @srsbvipb = Srsbvipb.find(params[:id])
     @srsbvipb.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @srsbvipb = Srsbvipb.find(params[:id])
     @srsbvipb.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @srsbvipb = Srsbvipb.find(params[:id])
    @srsbvipb.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end
  
end
