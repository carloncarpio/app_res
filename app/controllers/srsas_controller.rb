class SrsasController < ApplicationController
  before_filter :confirm_logged_in
  # GET /srsas
  # GET /srsas.json
  def index
    @srsas = Srsa.all
    @srsas = Srsa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @srsas }
    end
  end
  def index_b
    @srsas = Srsa.where(:section => 'B').order("id")
  end
  def index_c
    @srsas = Srsa.where(:section => 'C').order("id")
  end
  def index_d
    @srsas = Srsa.where(:section => 'D').order("id")
  end
  def index_e
    @srsas = Srsa.where(:section => 'E').order("id")
  end
  def index_f
    @srsas = Srsa.where(:section => 'F').order("id")
  end
  def show_all
    @srsas = Srsa.all
  end

  # GET /srsas/1
  # GET /srsas/1.json
  def show
    @srsa = Srsa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @srsa }
    end
  end

  # GET /srsas/new
  # GET /srsas/new.json
  def new
    @srsa = Srsa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @srsa }
    end
  end

  # GET /srsas/1/edit
  def edit
    @srsa = Srsa.find(params[:id])
  end

  # POST /srsas
  # POST /srsas.json
  def create
    @srsa = Srsa.new(params[:srsa])

    respond_to do |format|
      if @srsa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @srsa, status: :created, location: @srsa }
      else
        format.html { render action: "new" }
        format.json { render json: @srsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /srsas/1
  # PUT /srsas/1.json
  def update
    @srsa = Srsa.find(params[:id])

    respond_to do |format|
      if @srsa.update_attributes(params[:srsa])
        format.html { redirect_to @srsa, notice: 'Srsa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @srsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srsas/1
  # DELETE /srsas/1.json
  def destroy
    @srsa = Srsa.find(params[:id])
    @srsa.destroy

    respond_to do |format|
      format.html { redirect_to srsas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @srsas_a = Srsa.find_section('A').order("id")
    @srsas_b = Srsa.find_section('B').order("id")
    @srsas_c = Srsa.find_section('C').order("id")
    @srsas_d = Srsa.find_section('D').order("id")
    @srsas_e = Srsa.find_section('E').order("id")
    @srsas_f = Srsa.find_section('F').order("id")
    @srsas_g = Srsa.find_section('G').order("id")
    @srsas_h = Srsa.find_section('H').order("id")
    @srsas_i = Srsa.find_section('I').order("id")
    @srsas_j = Srsa.find_section('J').order("id")

    @srsas_with = Srsa.where(:status => true)
    @srsa = Srsa.all
    @my_srsa = Srsa.find_reserve(session[:company_name]).order("id")

    @srsas_total = Srsa.total_approved('yes').size
    @srsas_pending = Srsa.total_pending('no',true).size
  end

  def update_status
     @srsa = Srsa.find(params[:id])
     @srsa.update_attribute :approved, 'no'
     @srsa.update_attribute :paid, 'no'
     respond_to do |format|
      if @srsa.status == false
        if @srsa.update_attribute :status, true
           @srsa.update_attribute :company_name, session[:company_name]
           @srsa.update_attribute :company_contact, session[:company_contact]
           @srsa.update_attribute :company_email, session[:company_email]
           @srsa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @srsaa, notice: 'srsaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @srsaa.errors, status: :unprocessable_entity }
        end
      else
        if @srsa.update_attribute :status, false
           @srsa.update_attribute :company_name, nil
           @srsa.update_attribute :company_contact, nil
           @srsa.update_attribute :company_email, nil
           @srsa.update_attribute :user_id, nil
          #format.html { redirect_to @srsaa, notice: 'srsaa was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @srsaa.errors, status: :unprocessable_entity }
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
    @my_srsa = Srsa.where(:company_name => session[:company_name])
  end

  def approved
    @srsa = Srsa.find(params[:id])
    @srsa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@srsaa.company_email,@srsaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @srsa = Srsa.find(params[:id])
     @srsa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @srsa = Srsa.find(params[:id])
     @srsa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @srsa = Srsa.find(params[:id])
    @srsa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
