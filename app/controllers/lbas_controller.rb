class LbasController < ApplicationController
  # GET /lbas
  # GET /lbas.json
  def index
    @lbas = Lba.all
    @lbas = Lba.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbas }
    end
  end
  def index_b
    @lbas = Lba.where(:section => 'B').order("id")
  end
  def index_c
    @lbas = Lba.where(:section => 'C').order("id")
  end
  def index_d
    @lbas = Lba.where(:section => 'D').order("id")
  end
  def index_e
    @lbas = Lba.where(:section => 'E').order("id")
  end
  def index_f
    @lbas = Lba.where(:section => 'F').order("id")
  end
  def index_g
    @lbas = Lba.where(:section => 'G').order("id")
  end
  def index_h
    @lbas = Lba.where(:section => 'H').order("id")
  end
  def index_i
    @lbas = Lba.where(:section => 'I').order("id")
  end

  # GET /lbas/1
  # GET /lbas/1.json
  def show
    @lba = Lba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lba }
    end
  end

  # GET /lbas/new
  # GET /lbas/new.json
  def new
    @lba = Lba.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lba }
    end
  end

  # GET /lbas/1/edit
  def edit
    @lba = Lba.find(params[:id])
  end

  # POST /lbas
  # POST /lbas.json
  def create
    @lba = Lba.new(params[:lba])

    respond_to do |format|
      if @lba.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lba, status: :created, location: @lba }
      else
        format.html { render action: "new" }
        format.json { render json: @lba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbas/1
  # PUT /lbas/1.json
  def update
    @lba = Lba.find(params[:id])

    respond_to do |format|
      if @lba.update_attributes(params[:lba])
        format.html { redirect_to @lba, notice: 'Lba was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbas/1
  # DELETE /lbas/1.json
  def destroy
    @lba = Lba.find(params[:id])
    @lba.destroy

    respond_to do |format|
      format.html { redirect_to lbas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbas_a = Lba.find_section('A').order("id")
    @lbas_b = Lba.find_section('B').order("id")
    @lbas_c = Lba.find_section('C').order("id")
    @lbas_d = Lba.find_section('D').order("id")
    @lbas_e = Lba.find_section('E').order("id")
    @lbas_f = Lba.find_section('F').order("id")
    @lbas_g = Lba.find_section('G').order("id")
    @lbas_h = Lba.find_section('H').order("id")
    @lbas_i = Lba.find_section('I').order("id")
    @lbas_j = Lba.find_section('J').order("id")

    @lbas_with = Lba.where(:status => true)
    @lba = Lba.all
    @my_lba = Lba.find_reserve(session[:company_name]).order("id")

    @lbas_total = Lba.total_approved('yes').size
    @lbas_pending = Lba.total_pending('no',true).size
  end

  def update_status
     @lba = Lba.find(params[:id])
     @lba.update_attribute :approved, 'no'
     @lba.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbaa.status == false
        if @lba.update_attribute :status, true
           @lba.update_attribute :company_name, session[:company_name]
           @lba.update_attribute :company_contact, session[:company_contact]
           @lba.update_attribute :company_email, session[:company_email]
           @lba.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbaaa, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbaaa.errors, status: :unprocessable_entity }
        end
      else
        if @lba.update_attribute :status, false
           @lba.update_attribute :company_name, nil
           @lba.update_attribute :company_contact, nil
           @lba.update_attribute :company_email, nil
           @lba.update_attribute :user_id, nil
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
    @my_lba = Lba.where(:company_name => session[:company_name])
  end

  def approved
    @lba = Lba.find(params[:id])
    @lba.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbaaa.company_email,@lbaaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lba = Lba.find(params[:id])
     @lba.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lba = Lba.find(params[:id])
     @lba.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lba = Lba.find(params[:id])
    @lba.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
