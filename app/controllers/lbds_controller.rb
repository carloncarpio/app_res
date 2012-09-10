class LbdsController < ApplicationController
  # GET /lbds
  # GET /lbds.json
  def index
    @lbds = Lbd.all
    @lbds = Lbd.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbds }
    end
  end
  def index_b
    @lbds = Lbd.where(:section => 'B').order("id")
  end
  def index_c
    @lbds = Lbd.where(:section => 'C').order("id")
  end
  def index_d
    @lbds = Lbd.where(:section => 'D').order("id")
  end
  def index_e
    @lbds = Lbd.where(:section => 'E').order("id")
    #@lbds = lbd.all
  end
  def index_f
    @lbds = Lbd.where(:section => 'F').order("id")
  end
  def index_g
    @lbds = Lbd.where(:section => 'G').order("id")
  end
  def index_h
    @lbds = Lbd.where(:section => 'H').order("id")
  end
  def index_i
    @lbds = Lbd.where(:section => 'I').order("id")
  end

  # GET /lbds/1
  # GET /lbds/1.json
  def show
    @lbd = Lbd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbd }
    end
  end

  # GET /lbds/new
  # GET /lbds/new.json
  def new
    @lbd = Lbd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbd }
    end
  end

  # GET /lbds/1/edit
  def edit
    @lbd = Lbd.find(params[:id])
  end

  # POST /lbds
  # POST /lbds.json
  def create
    @lbd = Lbd.new(params[:lbd])

    respond_to do |format|
      if @lbd.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbd, status: :created, location: @lbd }
      else
        format.html { render action: "new" }
        format.json { render json: @lbd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbds/1
  # PUT /lbds/1.json
  def update
    @lbd = Lbd.find(params[:id])

    respond_to do |format|
      if @lbd.update_attributes(params[:lbd])
        format.html { redirect_to @lbd, notice: 'Lbd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbds/1
  # DELETE /lbds/1.json
  def destroy
    @lbd = Lbd.find(params[:id])
    @lbd.destroy

    respond_to do |format|
      format.html { redirect_to lbds_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbds_a = Lbd.find_section('A').order("id")

    @lbds_b = Lbd.find_section('B').order("id")
    @lbds_c = Lbd.find_section('C').order("id")
    @lbds_d = Lbd.find_section('D').order("id")
    @lbds_e = Lbd.find_section('E').order("id")
    @lbds_f = Lbd.find_section('F').order("id")
    @lbds_g = Lbd.find_section('G').order("id")
    @lbds_h = Lbd.find_section('H').order("id")
    @lbds_i = Lbd.find_section('I').order("id")



    @lbds_with = Lbd.where(:status => true)
    @lbds = Lbd.all
    @my_lbds = Lbd.find_reserve(session[:company_name]).order("id")


    @lbds_total = Lbd.total_approved('yes').size
    @lbds_pending = Lbd.total_pending('no',true).size


  end

  def update_status
     @lbd = Lbd.find(params[:id])
     @lbd.update_attribute :approved, 'no'
     @lbd.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbd.status == false
        if @lbd.update_attribute :status, true
           @lbd.update_attribute :company_name, session[:company_name]
           @lbd.update_attribute :company_contact, session[:company_contact]
           @lbd.update_attribute :company_email, session[:company_email]
           @lbd.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbd, notice: 'lbd was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbd.errors, status: :unprocessable_entity }
        end
      else
        if @lbd.update_attribute :status, false
           @lbd.update_attribute :company_name, nil
           @lbd.update_attribute :company_contact, nil
           @lbd.update_attribute :company_email, nil
           @lbd.update_attribute :user_id, nil
          #format.html { redirect_to @lbd, notice: 'lbd was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbd.errors, status: :unprocessable_entity }
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
    @my_lbds = lbd.where(:company_name => session[:company_name])
  end

  def approved
    @lbd = Lbd.find(params[:id])
    @lbd.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbd.company_email,@lbd.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbd = Lbd.find(params[:id])
     @lbd.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbd = Lbd.find(params[:id])
     @lbd.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbd = Lbd.find(params[:id])

    @lbd.update_attribute :paid, 'no'

     @lbd.update_attribute :paid, 'no'


    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end


end
