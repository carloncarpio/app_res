class LbbbsController < ApplicationController
  # GET /lbbbs
  # GET /lbbbs.json
  def index
    @lbbbs = Lbbb.all
    @lbbbs = Lbbb.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbbbs }
    end
  end
  def index_b
    @lbbbs = Lbbb.where(:section => 'B').order("id")
  end
  def index_c
    @lbbbs = Lbbb.where(:section => 'C').order("id")
  end
  def index_d
    @lbbbs = Lbbb.where(:section => 'D').order("id")
  end
  def index_e
    @lbbbs = Lbbb.where(:section => 'E').order("id")
  end
  def index_f
    @lbbbs = Lbbb.where(:section => 'F').order("id")
  end
  def index_g
    @lbbbs = Lbbb.where(:section => 'G').order("id")
  end
  def index_h
    @lbbbs = Lbbb.where(:section => 'H').order("id")
  end
  def index_i
    @lbbbs = Lbbb.where(:section => 'I').order("id")
  end
   def show_all
    @lbbbs = Lbbb.all
  end

  # GET /lbbbs/1
  # GET /lbbbs/1.json
  def show
    @lbbb = Lbbb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbbb }
    end
  end

  # GET /lbbbs/new
  # GET /lbbbs/new.json
  def new
    @lbbb = Lbbb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbbb }
    end
  end

  # GET /lbbbs/1/edit
  def edit
    @lbbb = Lbbb.find(params[:id])
  end

  # POST /lbbbs
  # POST /lbbbs.json
  def create
    @lbbb = Lbbb.new(params[:lbbb])

    respond_to do |format|
      if @lbbb.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbbb, status: :created, location: @lbbb }
      else
        format.html { render action: "new" }
        format.json { render json: @lbbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbbbs/1
  # PUT /lbbbs/1.json
  def update
    @lbbb = Lbbb.find(params[:id])

    respond_to do |format|
      if @lbbb.update_attributes(params[:lbbb])
        format.html { redirect_to @lbbb, notice: 'Lbbb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbbbs/1
  # DELETE /lbbbs/1.json
  def destroy
    @lbbb = Lbbb.find(params[:id])
    @lbbb.destroy

    respond_to do |format|
      format.html { redirect_to lbbbs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbbbs_a = Lbbb.find_section('A').order("id DESC")
    @lbbbs_b = Lbbb.find_section('B').order("id DESC")
    @lbbbs_c = Lbbb.find_section('C').order("id DESC")
    @lbbbs_d = Lbbb.find_section('D').order("id DESC")
    @lbbbs_e = Lbbb.find_section('E').order("id DESC")
    @lbbbs_f = Lbbb.find_section('F').order("id DESC")
    @lbbbs_g = Lbbb.find_section('G').order("id DESC")
    @lbbbs_h = Lbbb.find_section('H').order("id DESC")
    @lbbbs_i = Lbbb.find_section('I').order("id DESC")
    @lbbbs_j = Lbbb.find_section('J').order("id DESC")

    @lbbbs_with = Lbbb.where(:status => true)
    @lbbb = Lbbb.all
    @my_lbbb = Lbbb.find_reserve(session[:company_name]).order("id")

    @lbbbs_total = Lbbb.total_approved('yes').size
    @lbbbs_pending = Lbbb.total_pending('no',true).size
  end

  def update_status
     @lbbb = Lbbb.find(params[:id])
     @lbbb.update_attribute :approved, 'no'
     @lbbb.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbbb.status == false
        if @lbbb.update_attribute :status, true
           @lbbb.update_attribute :company_name, session[:company_name]
           @lbbb.update_attribute :company_contact, session[:company_contact]
           @lbbb.update_attribute :company_email, session[:company_email]
           @lbbb.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbbba, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbbba.errors, status: :unprocessable_entity }
        end
      else
        if @lbbb.update_attribute :status, false
           @lbbb.update_attribute :company_name, nil
           @lbbb.update_attribute :company_contact, nil
           @lbbb.update_attribute :company_email, nil
           @lbbb.update_attribute :user_id, nil
          #format.html { redirect_to @lbbba, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbbba.errors, status: :unprocessable_entity }
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
    @my_lbbb = Lbbb.where(:company_name => session[:company_name])
  end

  def approved
    @lbbb = Lbbb.find(params[:id])
    @lbbb.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbbba.company_email,@lbbba.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbbb = Lbbb.find(params[:id])
     @lbbb.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbbb = Lbbb.find(params[:id])
     @lbbb.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbbb = Lbbb.find(params[:id])
    @lbbb.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
