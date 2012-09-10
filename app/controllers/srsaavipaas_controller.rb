class SrsaavipaasController < ApplicationController
  # GET /srsaavipaas
  # GET /srsaavipaas.json
  def index
    @srsaavipaas = Srsaavipaa.all
    @srsaavipaas = Srsaavipaa.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @srsaavipaas }
    end
  end
  def index_b
    @srsaavipaas = Srsaavipaa.where(:section => 'B').order("id")
  end
  def index_c
    @srsaavipaas = Srsaavipaa.where(:section => 'C').order("id")
  end
  def index_d
    @srsaavipaas = Srsaavipaa.where(:section => 'D').order("id")
  end
  def index_e
    @srsaavipaas = Srsaavipaa.where(:section => 'E').order("id")
  end

  # GET /srsaavipaas/1
  # GET /srsaavipaas/1.json
  def show
    @srsaavipaa = Srsaavipaa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @srsaavipaa }
    end
  end

  # GET /srsaavipaas/new
  # GET /srsaavipaas/new.json
  def new
    @srsaavipaa = Srsaavipaa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @srsaavipaa }
    end
  end

  # GET /srsaavipaas/1/edit
  def edit
    @srsaavipaa = Srsaavipaa.find(params[:id])
  end

  # POST /srsaavipaas
  # POST /srsaavipaas.json
  def create
    @srsaavipaa = Srsaavipaa.new(params[:srsaavipaa])

    respond_to do |format|
      if @srsaavipaa.save
        format.html { redirect_to :action => 'index' }
        #format.html { redirect_to @srsaavipaa, notice: 'Srsaavipaa was successfully created.' }
        format.json { render json: @srsaavipaa, status: :created, location: @srsaavipaa }
      else
        format.html { render action: "new" }
        format.json { render json: @srsaavipaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /srsaavipaas/1
  # PUT /srsaavipaas/1.json
  def update
    @srsaavipaa = Srsaavipaa.find(params[:id])

    respond_to do |format|
      if @srsaavipaa.update_attributes(params[:srsaavipaa])
        format.html { redirect_to @srsaavipaa, notice: 'Srsaavipaa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @srsaavipaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srsaavipaas/1
  # DELETE /srsaavipaas/1.json
  def destroy
    @srsaavipaa = Srsaavipaa.find(params[:id])
    @srsaavipaa.destroy

    respond_to do |format|
      format.html { redirect_to srsaavipaas_url }
      format.json { head :no_content }
      format.js 
    end
  end

  def visual
    @srsaavipaas_a = Srsaavipaa.find_section('A').order("id")
    @srsaavipaas_b = Srsaavipaa.find_section('B').order("id")
    @srsaavipaas_c = Srsaavipaa.find_section('C').order("id")
    @srsaavipaas_d = Srsaavipaa.find_section('D').order("id")
    @srsaavipaas_e = Srsaavipaa.find_section('E').order("id")

    @srsaavipaas_with = Srsaavipaa.where(:status => true)
    @srsaavipaas = Srsaavipaa.all
    @my_srsaavipaas = Srsaavipaa.find_reserve(session[:company_name]).order("id")

    @srsaavipaas_total = Srsaavipaa.total_approved('yes').size
    @srsaavipaas_pending = Srsaavipaa.total_pending('no',true).size
  end

  def update_status
     @srsaavipaa = Srsaavipaa.find(params[:id])
     @srsaavipaa.update_attribute :approved, 'no'
     @srsaavipaa.update_attribute :paid, 'no'
     respond_to do |format|
      if @srsaavipaa.status == false
        if @srsaavipaa.update_attribute :status, true
           @srsaavipaa.update_attribute :company_name, session[:company_name]
           @srsaavipaa.update_attribute :company_contact, session[:company_contact]
           @srsaavipaa.update_attribute :company_email, session[:company_email]
           @srsaavipaa.update_attribute :user_id, session[:id]
          #format.html { redirect_to @Srsaavipaa, notice: 'Srsaavipaa was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @Srsaavipaa.errors, status: :unprocessable_entity }
        end
      else
        if @srsaavipaa.update_attribute :status, false
           @srsaavipaa.update_attribute :company_name, nil
           @srsaavipaa.update_attribute :company_contact, nil
           @srsaavipaa.update_attribute :company_email, nil
           @srsaavipaa.update_attribute :user_id, nil
          #format.html { redirect_to @Srsaavipaa, notice: 'Srsaavipaa was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @Srsaavipaa.errors, status: :unprocessable_entity }
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
    @my_srsaavipaas = Srsaavipaa.where(:company_name => session[:company_name])
  end

  def approved
    @srsaavipaa = Srsaavipaa.find(params[:id])
    @srsaavipaa.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@Srsaavipaa.company_email,@Srsaavipaa.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @srsaavipaa = Srsaavipaa.find(params[:id])
     @srsaavipaa.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @srsaavipaa = Srsaavipaa.find(params[:id])
     @srsaavipaa.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @srsaavipaa = Srsaavipaa.find(params[:id])
    @srsaavipaa.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
