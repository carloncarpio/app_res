class LbaasController < ApplicationController

  before_filter :confirm_logged_in
  # GET /lbaas
  # GET /lbaas.json
  def index
    @lbaas = Lbaa.all
    @lbaas = Lbaa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbaas }
    end
  end
  def index_b
    @lbaas = Lbaa.where(:section => 'B').order("id")
  end
  def index_c
    @lbaas = Lbaa.where(:section => 'C').order("id")
  end
  def index_d
    @lbaas = Lbaa.where(:section => 'D').order("id")
  end
  def index_e
    @lbaas = Lbaa.where(:section => 'E').order("id")
  end
  def index_f
    @lbaas = Lbaa.where(:section => 'F').order("id")
  end
  def index_g
    @lbaas = Lbaa.where(:section => 'G').order("id")
  end
  def index_h
    @lbaas = Lbaa.where(:section => 'H').order("id")
  end
  def index_i
    @lbaas = Lbaa.where(:section => 'I').order("id")
  end
  def show_all
    @lbaas = Lbaa.all
  end

  # GET /lbaas/1
  # GET /lbaas/1.json
  def show
    @lbaa = Lbaa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbaa }
    end
  end

  # GET /lbaas/new
  # GET /lbaas/new.json
  def new
    @lbaa = Lbaa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbaa }
    end
  end

  # GET /lbaas/1/edit
  def edit
    @lbaa = Lbaa.find(params[:id])
  end

  # POST /lbaas
  # POST /lbaas.json
  def create
    @lbaa = Lbaa.new(params[:lbaa])

    respond_to do |format|
      if @lbaa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbaa, status: :created, location: @lbaa }
      else
        format.html { render action: "new" }
        format.json { render json: @lbaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbaas/1
  # PUT /lbaas/1.json
  def update
    @lbaa = Lbaa.find(params[:id])

    respond_to do |format|
      if @lbaa.update_attributes(params[:lbaa])
        format.html { redirect_to @lbaa, notice: 'Lbaa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbaas/1
  # DELETE /lbaas/1.json
  def destroy
    @lbaa = Lbaa.find(params[:id])
    @lbaa.destroy

    respond_to do |format|
      format.html { redirect_to lbaas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbaas_a = Lbaa.find_section('A').order("id")
    @lbaas_b = Lbaa.find_section('B').order("id")
    @lbaas_c = Lbaa.find_section('C').order("id")
    @lbaas_d = Lbaa.find_section('D').order("id")
    @lbaas_e = Lbaa.find_section('E').order("id")
    @lbaas_f = Lbaa.find_section('F').order("id")
    @lbaas_g = Lbaa.find_section('G').order("id")
    @lbaas_h = Lbaa.find_section('H').order("id")
    @lbaas_i = Lbaa.find_section('I').order("id")
    @lbaas_j = Lbaa.find_section('J').order("id")

    @lbaas_with = Lbaa.where(:status => true)
    @lbaa = Lbaa.all
    @my_lbaa = Lbaa.find_reserve(session[:company_name]).order("id")

    @lbaas_total = Lbaa.total_approved('yes').size
    @lbaas_pending = Lbaa.total_pending('no',true).size
  end

  def update_status
     @lbaa = Lbaa.find(params[:id])
     @lbaa.update_attribute :approved, 'no'
     @lbaa.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbaa.status == false
        if @lbaa.update_attribute :status, true
           @lbaa.update_attribute :company_name, session[:company_name]
           @lbaa.update_attribute :company_contact, session[:company_contact]
           @lbaa.update_attribute :company_email, session[:company_email]
           @lbaa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbaaa, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbaaa.errors, status: :unprocessable_entity }
        end
      else
        if @lbaa.update_attribute :status, false
           @lbaa.update_attribute :company_name, nil
           @lbaa.update_attribute :company_contact, nil
           @lbaa.update_attribute :company_email, nil
           @lbaa.update_attribute :user_id, nil
          #format.html { redirect_to @lbaaa, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbaaa.errors, status: :unprocessable_entity }
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
    @my_lbaa = Lbaa.where(:company_name => session[:company_name])
  end

  def approved
    @lbaa = Lbaa.find(params[:id])
    @lbaa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbaaa.company_email,@lbaaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbaa = Lbaa.find(params[:id])
     @lbaa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbaa = Lbaa.find(params[:id])
     @lbaa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbaa = Lbaa.find(params[:id])
    @lbaa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
