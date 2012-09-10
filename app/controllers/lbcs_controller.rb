class LbcsController < ApplicationController
  # GET /lbcs
  # GET /lbcs.json
  def index
    @lbcs = Lbc.all
    @lbcs = Lbc.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbcs }
    end
  end
  def index_b
    @lbcs = Lbc.where(:section => 'B').order("id")
  end
  def index_c
    @lbcs = Lbc.where(:section => 'C').order("id")
  end
  def index_d
    @lbcs = Lbc.where(:section => 'D').order("id")
  end
  def index_e
    @lbcs = Lbc.where(:section => 'E').order("id")
    #@lbcs = lbcc.all
  end
  def index_f
    @lbcs = Lbc.where(:section => 'F').order("id")
  end
  def index_g
    @lbcs = Lbc.where(:section => 'G').order("id")
  end
  def index_h
    @lbcs = Lbc.where(:section => 'H').order("id")
  end
  def index_i
    @lbcs = Lbc.where(:section => 'I').order("id")
  end

  # GET /lbcs/1
  # GET /lbcs/1.json
  def show
    @lbc = Lbc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbc }
    end
  end

  # GET /lbcs/new
  # GET /lbcs/new.json
  def new
    @lbc = Lbc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbc }
    end
  end

  # GET /lbcs/1/edit
  def edit
    @lbc = Lbc.find(params[:id])
  end

  # POST /lbcs
  # POST /lbcs.json
  def create
    @lbc = Lbc.new(params[:lbc])

    respond_to do |format|
      if @lbc.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbc, status: :created, location: @lbc }
      else
        format.html { render action: "new" }
        format.json { render json: @lbc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbcs/1
  # PUT /lbcs/1.json
  def update
    @lbc = Lbc.find(params[:id])

    respond_to do |format|
      if @lbc.update_attributes(params[:lbc])
        format.html { redirect_to @lbc, notice: 'Lbc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbcs/1
  # DELETE /lbcs/1.json
  def destroy
    @lbc = Lbc.find(params[:id])
    @lbc.destroy

    respond_to do |format|
      format.html { redirect_to lbcs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbcs_a = Lbc.find_section('A').order("id")
    @lbcs_b = Lbc.find_section('B').order("id")
    @lbcs_c = Lbc.find_section('C').order("id")
    @lbcs_d = Lbc.find_section('D').order("id")
    @lbcs_e = Lbc.find_section('E').order("id")
    @lbcs_f = Lbc.find_section('F').order("id")
    @lbcs_g = Lbc.find_section('G').order("id")
    @lbcs_h = Lbc.find_section('H').order("id")
    @lbcs_i = Lbc.find_section('I').order("id")

    @lbcs_with = Lbc.where(:status => true)
    @lbcs = Lbc.all
    @my_lbcs = Lbc.find_reserve(session[:company_name]).order("id")

    @lbcs_total = Lbc.total_approved('yes').size
    @lbcs_pending = Lbc.total_pending('no',true).size
  end

  def update_status
     @lbc = Lbc.find(params[:id])
     @lbc.update_attribute :approved, 'no'
     @lbc.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbc.status == false
        if @lbc.update_attribute :status, true
           @lbc.update_attribute :company_name, session[:company_name]
           @lbc.update_attribute :company_contact, session[:company_contact]
           @lbc.update_attribute :company_email, session[:company_email]
           @lbc.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbcc, notice: 'lbcc was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbcc.errors, status: :unprocessable_entity }
        end
      else
        if @lbc.update_attribute :status, false
           @lbc.update_attribute :company_name, nil
           @lbc.update_attribute :company_contact, nil
           @lbc.update_attribute :company_email, nil
           @lbc.update_attribute :user_id, nil
          #format.html { redirect_to @lbcc, notice: 'lbcc was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbcc.errors, status: :unprocessable_entity }
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
    @my_lbcs = Lbc.where(:company_name => session[:company_name])
  end

  def approved
    @lbc = Lbc.find(params[:id])
    @lbc.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbcc.company_email,@lbcc.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbc = Lbc.find(params[:id])
     @lbc.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbc = Lbc.find(params[:id])
     @lbc.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbc = Lbc.find(params[:id])
    @lbc.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
