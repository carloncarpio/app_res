class LbddsController < ApplicationController

  before_filter :confirm_logged_in
  # GET /lbdds
  # GET /lbdds.json
  def index
    @lbdds = Lbdd.all
    @lbdds = Lbdd.where(:section => 'A').order("id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbdds }
    end
  end

  def index_b
    @lbdds = Lbdd.where(:section => 'B').order("id")
  end
  def index_c
    @lbdds = Lbdd.where(:section => 'C').order("id")
  end
  def index_d
    @lbdds = Lbdd.where(:section => 'D').order("id")
  end
  def index_e
    @lbdds = Lbdd.where(:section => 'E').order("id")
    #@lbdds = lbdd.all
  end
  def index_f
    @lbdds = Lbdd.where(:section => 'F').order("id")
  end
  def index_g
    @lbdds = Lbdd.where(:section => 'G').order("id")
  end
  def index_h
    @lbdds = Lbdd.where(:section => 'H').order("id")
  end
  def index_i
    @lbdds = Lbdd.where(:section => 'I').order("id")
  end
  def show_all
    @lbdds = Lbdd.all
  end

  # GET /lbdds/1
  # GET /lbdds/1.json
  def show
    @lbdd = Lbdd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbdd }
    end
  end

  # GET /lbdds/new
  # GET /lbdds/new.json
  def new
    @lbdd = Lbdd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbdd }
    end
  end

  # GET /lbdds/1/edit
  def edit
    @lbdd = Lbdd.find(params[:id])
  end

  # POST /lbdds
  # POST /lbdds.json
  def create
    @lbdd = Lbdd.new(params[:lbdd])

    respond_to do |format|
      if @lbdd.save
        format.html { redirect_to :action => 'index' }
        #format.html { redirect_to @lbdd, notice: 'lbdd was successfully created.' }
        format.json { render json: @lbdd, status: :created, location: @lbdd }
      else
        format.html { render action: "new" }
        format.json { render json: @lbdd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbdds/1
  # PUT /lbdds/1.json
  def update
    @lbdd = Lbdd.find(params[:id])

    respond_to do |format|
      if @lbdd.update_attributes(params[:lbdd])
        format.html { redirect_to @lbdd, notice: 'lbdd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbdd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbdds/1
  # DELETE /lbdds/1.json
  def destroy
    @lbdd = Lbdd.find(params[:id])
    @lbdd.destroy

    respond_to do |format|
      format.html { redirect_to lbdds_url }
      #format.json { head :no_content }
      format.js 
    end
  end

  def visual
    @lbdds_a = Lbdd.find_section('A').order("id")

    @lbdds_b = Lbdd.find_section('B').order("id")
    @lbdds_c = Lbdd.find_section('C').order("id")
    @lbdds_d = Lbdd.find_section('D').order("id")
    @lbdds_e = Lbdd.find_section('E').order("id")
    @lbdds_f = Lbdd.find_section('F').order("id")
    @lbdds_g = Lbdd.find_section('G').order("id")
    @lbdds_h = Lbdd.find_section('H').order("id")
    @lbdds_i = Lbdd.find_section('I').order("id")



    @lbdds_with = Lbdd.where(:status => true)
    @lbdds = Lbdd.all
    @my_lbdds = Lbdd.find_reserve(session[:company_name]).order("id")


    @lbdds_total = Lbdd.total_approved('yes').size
    @lbdds_pending = Lbdd.total_pending('no',true).size


  end

  def update_status
     @lbdd = Lbdd.find(params[:id])
     @lbdd.update_attribute :approved, 'no'
     @lbdd.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbdd.status == false
        if @lbdd.update_attribute :status, true
           @lbdd.update_attribute :company_name, session[:company_name]
           @lbdd.update_attribute :company_contact, session[:company_contact]
           @lbdd.update_attribute :company_email, session[:company_email]
           @lbdd.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbdd, notice: 'lbdd was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbdd.errors, status: :unprocessable_entity }
        end
      else
        if @lbdd.update_attribute :status, false
           @lbdd.update_attribute :company_name, nil
           @lbdd.update_attribute :company_contact, nil
           @lbdd.update_attribute :company_email, nil
           @lbdd.update_attribute :user_id, nil
          #format.html { redirect_to @lbdd, notice: 'lbdd was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbdd.errors, status: :unprocessable_entity }
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
    @my_lbdds = Lbdd.where(:company_name => session[:company_name])
  end

  def approved
    @lbdd = Lbdd.find(params[:id])
    @lbdd.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbdd.company_email,@lbdd.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbdd = Lbdd.find(params[:id])
     @lbdd.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbdd = Lbdd.find(params[:id])
     @lbdd.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbdd = Lbdd.find(params[:id])

    @lbdd.update_attribute :paid, 'no'

     @lbdd.update_attribute :paid, 'no'


    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  

end
