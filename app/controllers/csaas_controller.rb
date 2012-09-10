class CsaasController < ApplicationController
  # GET /csaas
  # GET /csaas.json
  def index
    @csaas = Csaa.all
    @csaas = Csaa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @csaas }
    end
  end
  def index_b
    @csaas = Csaa.where(:section => 'B').order("id")
  end
  def index_c
    @csaas = Csaa.where(:section => 'C').order("id")
  end
  def index_d
    @csaas = Csaa.where(:section => 'D').order("id")
  end
  def index_e
    @csaas = Csaa.where(:section => 'E').order("id")
    #@csaas = csaa.all
  end
  def index_f
    @csaas = Csaa.where(:section => 'F').order("id")
  end
  def index_g
    @csaas = Csaa.where(:section => 'G').order("id")
  end
  def index_h
    @csaas = Csaa.where(:section => 'H').order("id")
  end
  def index_i
    @csaas = Csaa.where(:section => 'I').order("id")
  end
  def index_j
    @csaas = Csaa.where(:section => 'J').order("id")
  end

  # GET /csaas/1
  # GET /csaas/1.json
  def show
    @csaa = Csaa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @csaa }
    end
  end

  # GET /csaas/new
  # GET /csaas/new.json
  def new
    @csaa = Csaa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @csaa }
    end
  end

  # GET /csaas/1/edit
  def edit
    @csaa = Csaa.find(params[:id])
  end

  # POST /csaas
  # POST /csaas.json
  def create
    @csaa = Csaa.new(params[:csaa])

    respond_to do |format|
      if @csaa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @csaa, status: :created, location: @csaa }
      else
        format.html { render action: "new" }
        format.json { render json: @csaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /csaas/1
  # PUT /csaas/1.json
  def update
    @csaa = Csaa.find(params[:id])

    respond_to do |format|
      if @csaa.update_attributes(params[:csaa])
        format.html { redirect_to @csaa, notice: 'Csaa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @csaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csaas/1
  # DELETE /csaas/1.json
  def destroy
    @csaa = Csaa.find(params[:id])
    @csaa.destroy

    respond_to do |format|
      format.html { redirect_to csaas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @csaas_a = Csaa.find_section('A').order("id")
    @csaas_b = Csaa.find_section('B').order("id")
    @csaas_c = Csaa.find_section('C').order("id")
    @csaas_d = Csaa.find_section('D').order("id")
    @csaas_e = Csaa.find_section('E').order("id")
    @csaas_f = Csaa.find_section('F').order("id")
    @csaas_g = Csaa.find_section('G').order("id")
    @csaas_h = Csaa.find_section('H').order("id")
    @csaas_i = Csaa.find_section('I').order("id")
    @csaas_j = Csaa.find_section('J').order("id")

    @csaas_with = Csaa.where(:status => true)
    @csaas = Csaa.all
    @my_csaas = Csaa.find_reserve(session[:company_name]).order("id")

    @csaas_total = Csaa.total_approved('yes').size
    @csaas_pending = Csaa.total_pending('no',true).size
  end

  def update_status
     @csaa = Csaa.find(params[:id])
     @csaa.update_attribute :approved, 'no'
     @csaa.update_attribute :paid, 'no'
     respond_to do |format|
      if @csaa.status == false
        if @csaa.update_attribute :status, true
           @csaa.update_attribute :company_name, session[:company_name]
           @csaa.update_attribute :company_contact, session[:company_contact]
           @csaa.update_attribute :company_email, session[:company_email]
           @csaa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @csaa, notice: 'csaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @csaa.errors, status: :unprocessable_entity }
        end
      else
        if @csaa.update_attribute :status, false
           @csaa.update_attribute :company_name, nil
           @csaa.update_attribute :company_contact, nil
           @csaa.update_attribute :company_email, nil
           @csaa.update_attribute :user_id, nil
          #format.html { redirect_to @csaa, notice: 'csaa was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @csaa.errors, status: :unprocessable_entity }
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
    @my_csaas = csaa.where(:company_name => session[:company_name])
  end

  def approved
    @csaa = Csaa.find(params[:id])
    @csaa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@csaa.company_email,@csaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @csaa = Csaa.find(params[:id])
     @csaa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @csaa = Csaa.find(params[:id])
     @csaa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @csaa = Csaa.find(params[:id])
    @csaa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end


end
