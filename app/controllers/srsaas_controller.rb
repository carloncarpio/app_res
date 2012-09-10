class SrsaasController < ApplicationController
  # GET /srsaas
  # GET /srsaas.json
  def index
    @srsaas = Srsaa.all
    @srsaas = Srsaa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @srsaas }
    end
  end
  def index_b
    @srsaas = Srsaa.where(:section => 'B').order("id")
  end
  def index_c
    @srsaas = Srsaa.where(:section => 'C').order("id")
  end
  def index_d
    @srsaas = Srsaa.where(:section => 'D').order("id")
  end
  def index_e
    @srsaas = Srsaa.where(:section => 'E').order("id")
    #@srsaas = lbdd.all
  end
  def index_f
    @srsaas = Srsaa.where(:section => 'F').order("id")
  end
  def index_g
    @srsaas = Srsaa.where(:section => 'G').order("id")
  end
  def index_h
    @srsaas = Srsaa.where(:section => 'H').order("id")
  end
  def index_i
    @srsaas = Srsaa.where(:section => 'I').order("id")
  end

  # GET /srsaas/1
  # GET /srsaas/1.json
  def show
    @srsaa = Srsaa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @srsaa }
    end
  end

  # GET /srsaas/new
  # GET /srsaas/new.json
  def new
    @srsaa = Srsaa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @srsaa }
    end
  end

  # GET /srsaas/1/edit
  def edit
    @srsaa = Srsaa.find(params[:id])
  end

  # POST /srsaas
  # POST /srsaas.json
  def create
    @srsaa = Srsaa.new(params[:srsaa])

    respond_to do |format|
      if @srsaa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @srsaa, status: :created, location: @srsaa }
      else
        format.html { render action: "new" }
        format.json { render json: @srsaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /srsaas/1
  # PUT /srsaas/1.json
  def update
    @srsaa = Srsaa.find(params[:id])

    respond_to do |format|
      if @srsaa.update_attributes(params[:srsaa])
        format.html { redirect_to @srsaa, notice: 'Srsaa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @srsaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srsaas/1
  # DELETE /srsaas/1.json
  def destroy
    @srsaa = Srsaa.find(params[:id])
    @srsaa.destroy

    respond_to do |format|
      format.html { redirect_to srsaas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @srsaas_a = Srsaa.find_section('A').order("id DESC")
    @srsaas_b = Srsaa.find_section('B').order("id DESC")
    @srsaas_c = Srsaa.find_section('C').order("id DESC")
    @srsaas_d = Srsaa.find_section('D').order("id DESC")
    @srsaas_e = Srsaa.find_section('E').order("id DESC")
    @srsaas_f = Srsaa.find_section('F').order("id DESC")
    @srsaas_g = Srsaa.find_section('G').order("id DESC")
    @srsaas_h = Srsaa.find_section('H').order("id DESC")
    @srsaas_i = Srsaa.find_section('I').order("id DESC")

    @srsaas_with = Srsaa.where(:status => true)
    @srsaas = Srsaa.all
    @my_srsaas = Srsaa.find_reserve(session[:company_name]).order("id")

    @srsaas_total = Srsaa.total_approved('yes').size
    @srsaas_pending = Srsaa.total_pending('no',true).size
  end

  def update_status
     @srsaa = Srsaa.find(params[:id])
     @srsaa.update_attribute :approved, 'no'
     @srsaa.update_attribute :paid, 'no'
     respond_to do |format|
      if @srsaa.status == false
        if @srsaa.update_attribute :status, true
           @srsaa.update_attribute :company_name, session[:company_name]
           @srsaa.update_attribute :company_contact, session[:company_contact]
           @srsaa.update_attribute :company_email, session[:company_email]
           @srsaa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @srsaa, notice: 'srsaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @srsaa.errors, status: :unprocessable_entity }
        end
      else
        if @srsaa.update_attribute :status, false
           @srsaa.update_attribute :company_name, nil
           @srsaa.update_attribute :company_contact, nil
           @srsaa.update_attribute :company_email, nil
           @srsaa.update_attribute :user_id, nil
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
    @my_srsaas = Srsaa.where(:company_name => session[:company_name])
  end

  def approved
    @srsaa = Srsaa.find(params[:id])
    @srsaa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@srsaa.company_email,@srsaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @srsaa = Srsaa.find(params[:id])
     @srsaa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @srsaa = Srsaa.find(params[:id])
     @srsaa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @srsaa = Srsaa.find(params[:id])
    @srsaa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end


end
