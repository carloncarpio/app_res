class VipasrsasController < ApplicationController
  before_filter :confirm_logged_in
  # GET /vipasrsas
  # GET /vipasrsas.json
  def index
    @vipasrsas = Vipasrsa.all
    @vipasrsas = Vipasrsa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vipasrsas }
    end
  end
  def index_b
    @vipasrsas = Vipasrsa.where(:section => 'B').order("id")
  end
  def index_c
    @vipasrsas = Vipasrsa.where(:section => 'C').order("id")
  end
  def index_d
    @vipasrsas = Vipasrsa.where(:section => 'D').order("id")
  end
  def index_e
    @vipasrsas = Vipasrsa.where(:section => 'E').order("id")
    #@vipasrsas = vipasrsaa.all
  end
  def index_f
    @vipasrsas = Vipasrsa.where(:section => 'F').order("id")
  end
  def index_g
    @vipasrsas = Vipasrsa.where(:section => 'G').order("id")
  end
  def index_h
    @vipasrsas = Vipasrsa.where(:section => 'H').order("id")
  end
  def index_i
    @vipasrsas = Vipasrsa.where(:section => 'I').order("id")
  end
  def index_j
    @vipasrsas = Vipasrsa.where(:section => 'J').order("id")
  end
  def show_all
    @vipasrsas = Vipasrsa.all
  end

  # GET /vipasrsas/1
  # GET /vipasrsas/1.json
  def show
    @vipasrsa = Vipasrsa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vipasrsa }
    end
  end

  # GET /vipasrsas/new
  # GET /vipasrsas/new.json
  def new
    @vipasrsa = Vipasrsa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vipasrsa }
    end
  end

  # GET /vipasrsas/1/edit
  def edit
    @vipasrsa = Vipasrsa.find(params[:id])
  end

  # POST /vipasrsas
  # POST /vipasrsas.json
  def create
    @vipasrsa = Vipasrsa.new(params[:vipasrsa])

    respond_to do |format|
      if @vipasrsa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @vipasrsa, status: :created, location: @vipasrsa }
      else
        format.html { render action: "new" }
        format.json { render json: @vipasrsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vipasrsas/1
  # PUT /vipasrsas/1.json
  def update
    @vipasrsa = Vipasrsa.find(params[:id])

    respond_to do |format|
      if @vipasrsa.update_attributes(params[:vipasrsa])
        format.html { redirect_to @vipasrsa, notice: 'Vipasrsa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vipasrsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vipasrsas/1
  # DELETE /vipasrsas/1.json
  def destroy
    @vipasrsa = Vipasrsa.find(params[:id])
    @vipasrsa.destroy

    respond_to do |format|
      format.html { redirect_to vipasrsas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @vipasrsas_a = Vipasrsa.find_section('A').order("id")
    @vipasrsas_b = Vipasrsa.find_section('B').order("id")
    @vipasrsas_c = Vipasrsa.find_section('C').order("id")
    @vipasrsas_d = Vipasrsa.find_section('D').order("id")
    @vipasrsas_e = Vipasrsa.find_section('E').order("id")
    @vipasrsas_f = Vipasrsa.find_section('F').order("id")
    @vipasrsas_g = Vipasrsa.find_section('G').order("id")
    @vipasrsas_h = Vipasrsa.find_section('H').order("id")
    @vipasrsas_i = Vipasrsa.find_section('I').order("id")
    @vipasrsas_j = Vipasrsa.find_section('J').order("id")

    @vipasrsas_with = Vipasrsa.where(:status => true)
    @vipasrsas = Vipasrsa.all
    @my_vipasrsas = Vipasrsa.find_reserve(session[:company_name]).order("id")

    @vipasrsas_total = Vipasrsa.total_approved('yes').size
    @vipasrsas_pending = Vipasrsa.total_pending('no',true).size
  end

  def update_status
     @vipasrsa = Vipasrsa.find(params[:id])
     @vipasrsa.update_attribute :approved, 'no'
     @vipasrsa.update_attribute :paid, 'no'
     respond_to do |format|
      if @vipasrsa.status == false
        if @vipasrsa.update_attribute :status, true
           @vipasrsa.update_attribute :company_name, session[:company_name]
           @vipasrsa.update_attribute :company_contact, session[:company_contact]
           @vipasrsa.update_attribute :company_email, session[:company_email]
           @vipasrsa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @vipasrsaa, notice: 'vipasrsaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipasrsaa.errors, status: :unprocessable_entity }
        end
      else
        if @vipasrsa.update_attribute :status, false
           @vipasrsa.update_attribute :company_name, nil
           @vipasrsa.update_attribute :company_contact, nil
           @vipasrsa.update_attribute :company_email, nil
           @vipasrsa.update_attribute :user_id, nil
          #format.html { redirect_to @vipasrsaa, notice: 'vipasrsaa was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipasrsaa.errors, status: :unprocessable_entity }
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
    @my_vipasrsas = Vipasrsaa.where(:company_name => session[:company_name])
  end

  def approved
    @vipasrsa = Vipasrsa.find(params[:id])
    @vipasrsa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@vipasrsaa.company_email,@vipasrsaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @vipasrsa = Vipasrsa.find(params[:id])
     @vipasrsa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @vipasrsa = Vipasrsa.find(params[:id])
     @vipasrsa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @vipasrsa = Vipasrsa.find(params[:id])
    @vipasrsa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end
  
end
