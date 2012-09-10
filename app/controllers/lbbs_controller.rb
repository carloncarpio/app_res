class LbbsController < ApplicationController
  # GET /lbbs
  # GET /lbbs.json
  def index
    @lbbs = Lbb.all
    @lbbs = Lbb.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbbs }
    end
  end
  def index_b
    @lbbs = Lbb.where(:section => 'B').order("id")
  end
  def index_c
    @lbbs = Lbb.where(:section => 'C').order("id")
  end
  def index_d
    @lbbs = Lbb.where(:section => 'D').order("id")
  end
  def index_e
    @lbbs = Lbb.where(:section => 'E').order("id")
  end
  def index_f
    @lbbs = Lbb.where(:section => 'F').order("id")
  end
  def index_g
    @lbbs = Lbb.where(:section => 'G').order("id")
  end
  def index_h
    @lbbs = Lbb.where(:section => 'H').order("id")
  end
  def index_i
    @lbbs = Lbb.where(:section => 'I').order("id")
  end

  # GET /lbbs/1
  # GET /lbbs/1.json
  def show
    @lbb = Lbb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lbb }
    end
  end

  # GET /lbbs/new
  # GET /lbbs/new.json
  def new
    @lbb = Lbb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lbb }
    end
  end

  # GET /lbbs/1/edit
  def edit
    @lbb = Lbb.find(params[:id])
  end

  # POST /lbbs
  # POST /lbbs.json
  def create
    @lbb = Lbb.new(params[:lbb])

    respond_to do |format|
      if @lbb.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @lbb, status: :created, location: @lbb }
      else
        format.html { render action: "new" }
        format.json { render json: @lbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lbbs/1
  # PUT /lbbs/1.json
  def update
    @lbb = Lbb.find(params[:id])

    respond_to do |format|
      if @lbb.update_attributes(params[:lbb])
        format.html { redirect_to @lbb, notice: 'Lbb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lbbs/1
  # DELETE /lbbs/1.json
  def destroy
    @lbb = Lbb.find(params[:id])
    @lbb.destroy

    respond_to do |format|
      format.html { redirect_to lbbs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def visual
    @lbbs_a = Lbb.find_section('A').order("id")
    @lbbs_b = Lbb.find_section('B').order("id")
    @lbbs_c = Lbb.find_section('C').order("id")
    @lbbs_d = Lbb.find_section('D').order("id")
    @lbbs_e = Lbb.find_section('E').order("id")
    @lbbs_f = Lbb.find_section('F').order("id")
    @lbbs_g = Lbb.find_section('G').order("id")
    @lbbs_h = Lbb.find_section('H').order("id")
    @lbbs_i = Lbb.find_section('I').order("id")
    @lbbs_j = Lbb.find_section('J').order("id")

    @lbbs_with = Lbb.where(:status => true)
    @lbb = Lbb.all
    @my_lbb = Lbb.find_reserve(session[:company_name]).order("id")

    @lbbs_total = Lbb.total_approved('yes').size
    @lbbs_pending = Lbb.total_pending('no',true).size
  end

  def update_status
     @lbb = Lbb.find(params[:id])
     @lbb.update_attribute :approved, 'no'
     @lbb.update_attribute :paid, 'no'
     respond_to do |format|
      if @lbb.status == false
        if @lbb.update_attribute :status, true
           @lbb.update_attribute :company_name, session[:company_name]
           @lbb.update_attribute :company_contact, session[:company_contact]
           @lbb.update_attribute :company_email, session[:company_email]
           @lbb.update_attribute :user_id, session[:id]
          #format.html { redirect_to @lbbba, notice: 'lbbba was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @lbbba.errors, status: :unprocessable_entity }
        end
      else
        if @lbb.update_attribute :status, false
           @lbb.update_attribute :company_name, nil
           @lbb.update_attribute :company_contact, nil
           @lbb.update_attribute :company_email, nil
           @lbb.update_attribute :user_id, nil
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
    @my_lbb = Lbb.where(:company_name => session[:company_name])
  end

  def approved
    @lbb = Lbb.find(params[:id])
    @lbb.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@lbbba.company_email,@lbbba.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @lbb = Lbb.find(params[:id])
     @lbb.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @lbb = Lbb.find(params[:id])
     @lbb.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @lbb = Lbb.find(params[:id])
    @lbb.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
