class LbccsController < ApplicationController
  # GET /lbccs
  # GET /lbccs.json
  def index
    #@lbccs = Lbcc.all
    @lbccs = Lbcc.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbccs }
    end
  end
  def index_b
    @lbccs = Lbcc.where(:section => 'B').order("id")
  end
  def index_c
    @lbccs = Lbcc.where(:section => 'C').order("id")
  end
  def index_d
    @lbccs = Lbcc.where(:section => 'D').order("id")
  end
  def index_e
    @lbccs = Lbcc.where(:section => 'E').order("id")
    #@lbccs = lbcc.all
  end
  def index_f
    @lbccs = Lbcc.where(:section => 'F').order("id")
  end
  def index_g
    @lbccs = Lbcc.where(:section => 'G').order("id")
  end
  def index_h
    @lbccs = Lbcc.where(:section => 'H').order("id")
  end
  def index_i
    @lbccs = Lbcc.where(:section => 'I').order("id")
  end

  # GET /lbccs/1
  # GET /lbccs/1.json
  def show
    @lbcc = Lbcc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbcc }
    end
  end

  # GET /lbccs/new
  # GET /lbccs/new.json
  def new
    @lbcc = Lbcc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbcc }
    end
  end

  # GET /lbccs/1/edit
  def edit
    @lbcc = Lbcc.find(params[:id])
  end

  # POST /lbccs
  # POST /lbccs.json
  def create
    @lbcc = Lbcc.new(params[:lbcc])

    respond_to do |format|
      if @lbcc.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbcc, status: :created, location: @lbcc }
      else
        format.html { render action: "new" }
        format.json { render json: @lbcc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbccs/1
  # PUT /lbccs/1.json
  def update
    @lbcc = Lbcc.find(params[:id])

    respond_to do |format|
      if @lbcc.update_attributes(params[:lbcc])
        format.html { redirect_to @lbcc, notice: 'Lbcc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbcc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbccs/1
  # DELETE /lbccs/1.json
  def destroy
    @lbcc = Lbcc.find(params[:id])
    @lbcc.destroy

    respond_to do |format|
      format.html { redirect_to lbccs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbccs_a = Lbcc.find_section('A').order("id")
    @lbccs_b = Lbcc.find_section('B').order("id")
    @lbccs_c = Lbcc.find_section('C').order("id")
    @lbccs_d = Lbcc.find_section('D').order("id")
    @lbccs_e = Lbcc.find_section('E').order("id")
    @lbccs_f = Lbcc.find_section('F').order("id")
    @lbccs_g = Lbcc.find_section('G').order("id")
    @lbccs_h = Lbcc.find_section('H').order("id")
    @lbccs_i = Lbcc.find_section('I').order("id")

    @lbccs_with = Lbcc.where(:status => true)
    @lbccs = Lbcc.all
    @my_lbccs = Lbcc.find_reserve(session[:company_name]).order("id")

    @lbccs_total = Lbcc.total_approved('yes').size
    @lbccs_pending = Lbcc.total_pending('no',true).size
  end

  def update_status
     @lbcc = Lbcc.find(params[:id])
     @lbcc.update_attribute :approved, 'no'
     @lbcc.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbcc.status == false
        if @lbcc.update_attribute :status, true
           @lbcc.update_attribute :company_name, session[:company_name]
           @lbcc.update_attribute :company_contact, session[:company_contact]
           @lbcc.update_attribute :company_email, session[:company_email]
           @lbcc.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbcc, notice: 'lbcc was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbcc.errors, status: :unprocessable_entity }
        end
      else
        if @lbcc.update_attribute :status, false
           @lbcc.update_attribute :company_name, nil
           @lbcc.update_attribute :company_contact, nil
           @lbcc.update_attribute :company_email, nil
           @lbcc.update_attribute :user_id, nil
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
    @my_lbccs = Lbcc.where(:company_name => session[:company_name])
  end

  def approved
    @lbcc = Lbcc.find(params[:id])
    @lbcc.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbcc.company_email,@lbcc.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbcc = Lbcc.find(params[:id])
     @lbcc.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbcc = Lbcc.find(params[:id])
     @lbcc.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbcc = Lbcc.find(params[:id])
    @lbcc.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
