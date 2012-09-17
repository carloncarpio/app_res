class CsasController < ApplicationController

  before_filter :confirm_logged_in
  # GET /csas
  # GET /csas.json
  def index
    @csas = Csa.all
    @csas = Csa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @csas }
    end
  end
  def index_b
    @csas = Csa.where(:section => 'B').order("id")
  end
  def index_c
    @csas = Csa.where(:section => 'C').order("id")
  end
  def index_d
    @csas = Csa.where(:section => 'D').order("id")
  end
  def index_e
    @csas = Csa.where(:section => 'E').order("id")
    #@csas = csaa.all
  end
  def index_f
    @csas = Csa.where(:section => 'F').order("id")
  end
  def index_g
    @csas = Csa.where(:section => 'G').order("id")
  end
  def index_h
    @csas = Csa.where(:section => 'H').order("id")
  end
  def index_i
    @csas = Csa.where(:section => 'I').order("id")
  end
  def index_j
    @csas = Csa.where(:section => 'J').order("id")
  end

  # GET /csas/1
  # GET /csas/1.json
  def show
    @csa = Csa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @csa }
    end
  end

  # GET /csas/new
  # GET /csas/new.json
  def new
    @csa = Csa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @csa }
    end
  end

  # GET /csas/1/edit
  def edit
    @csa = Csa.find(params[:id])
  end

  # POST /csas
  # POST /csas.json
  def create
    @csa = Csa.new(params[:csa])

    respond_to do |format|
      if @csa.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @csa, status: :created, location: @csa }
      else
        format.html { render action: "new" }
        format.json { render json: @csa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /csas/1
  # PUT /csas/1.json
  def update
    @csa = Csa.find(params[:id])

    respond_to do |format|
      if @csa.update_attributes(params[:csa])
        format.html { redirect_to @csa, notice: 'Csa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @csa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csas/1
  # DELETE /csas/1.json
  def destroy
    @csa = Csa.find(params[:id])
    @csa.destroy

    respond_to do |format|
      format.html { redirect_to csas_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @csas_a = Csa.find_section('A').order("id")
    @csas_b = Csa.find_section('B').order("id")
    @csas_c = Csa.find_section('C').order("id")
    @csas_d = Csa.find_section('D').order("id")
    @csas_e = Csa.find_section('E').order("id")
    @csas_f = Csa.find_section('F').order("id")
    @csas_g = Csa.find_section('G').order("id")
    @csas_h = Csa.find_section('H').order("id")
    @csas_i = Csa.find_section('I').order("id")
    @csas_j = Csa.find_section('J').order("id")

    @csas_with = Csa.where(:status => true)
    @csas = Csa.all
    @my_csas = Csa.find_reserve(session[:company_name]).order("id")

    @csas_total = Csa.total_approved('yes').size
    @csas_pending = Csa.total_pending('no',true).size
  end

  def update_status
     @csa = Csa.find(params[:id])
     @csa.update_attribute :approved, 'no'
     @csa.update_attribute :paid, 'no'
     respond_to do |format|
      if @csa.status == false
        if @csa.update_attribute :status, true
           @csa.update_attribute :company_name, session[:company_name]
           @csa.update_attribute :company_contact, session[:company_contact]
           @csa.update_attribute :company_email, session[:company_email]
           @csa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @csaa, notice: 'csaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @csaa.errors, status: :unprocessable_entity }
        end
      else
        if @csa.update_attribute :status, false
           @csa.update_attribute :company_name, nil
           @csa.update_attribute :company_contact, nil
           @csa.update_attribute :company_email, nil
           @csa.update_attribute :user_id, nil
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
    @my_csas = Csa.where(:company_name => session[:company_name])
  end

  def approved
    @csa = Csa.find(params[:id])
    @csa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@csaa.company_email,@csaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @csa = Csa.find(params[:id])
     @csa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @csa = Csa.find(params[:id])
     @csa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @csa = Csa.find(params[:id])
    @csa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
