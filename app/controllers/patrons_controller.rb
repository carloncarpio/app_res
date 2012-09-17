class PatronsController < ApplicationController
  before_filter :confirm_logged_in
  # GET /patrons
  # GET /patrons.json
  def index
    #@patrons = Patron.all
    @patrons = Patron.where(:section => 'A').order("id")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patrons }
    end
  end
  def index_b
    @patrons = Patron.where(:section => 'B').order("id")
  end
  def index_c
    @patrons = Patron.where(:section => 'C').order("id")
  end
  def index_d
    @patrons = Patron.where(:section => 'D').order("id")
  end
  def index_e
    @patrons = Patron.where(:section => 'E').order("id")
  end
  def index_f
    @patrons = Patron.where(:section => 'F').order("id")
  end
  def index_g
    @patrons = Patron.where(:section => 'G').order("id")
  end
  def index_h
    @patrons = Patron.where(:section => 'H').order("id")
  end
  def index_i
    @patrons = Patron.where(:section => 'I').order("id")
  end
  def index_j
    @patrons = Patron.where(:section => 'J').order("id")
  end
  def index_k
    @patrons = Patron.where(:section => 'K').order("id")
  end
  def index_l
    @patrons = Patron.where(:section => 'L').order("id")
  end
  def index_m
    @patrons = Patron.where(:section => 'M').order("id")
  end
  def index_n
    @patrons = Patron.where(:section => 'N').order("id")
  end
  def index_o
    @patrons = Patron.where(:section => 'O').order("id")
  end
  def index_p
    @patrons = Patron.where(:section => 'P').order("id")
  end
  def index_q
    @patrons = Patron.where(:section => 'Q').order("id")
  end
   def index_r
    @patrons = Patron.where(:section => 'R').order("id")
  end
  def index_s
    @patrons = Patron.where(:section => 'S').order("id")
  end
  def index_t
    @patrons = Patron.where(:section => 'T').order("id")
  end

   def show_all
    @patrons = Patron.all
  end

  # GET /patrons/1
  # GET /patrons/1.json
  def show
    @patron = Patron.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patron }
    end
  end

  # GET /patrons/new
  # GET /patrons/new.json
  def new
    @patron = Patron.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patron }
    end
  end

  # GET /patrons/1/edit
  def edit
    @patron = Patron.find(params[:id])
  end

  # POST /patrons
  # POST /patrons.json
  def create
    @patron = Patron.new(params[:patron])

    respond_to do |format|
      if @patron.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @patron, status: :created, location: @patron }
      else
        format.html { render action: "new" }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patrons/1
  # PUT /patrons/1.json
  def update
    @patron = Patron.find(params[:id])

    respond_to do |format|
      if @patron.update_attributes(params[:patron])
        format.html { redirect_to @patron, notice: 'Patron was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrons/1
  # DELETE /patrons/1.json
  def destroy
    @patron = Patron.find(params[:id])
    @patron.destroy

    respond_to do |format|
      format.html { redirect_to patrons_url }
      format.json { head :no_content }
      format.js
    end
  end


  def visual
    @patrons_a = Patron.find_section('A').order("id ")
    @patrons_b = Patron.find_section('B').order("id ")
    @patrons_c = Patron.find_section('C').order("id ")
    @patrons_d = Patron.find_section('D').order("id ")
    @patrons_e = Patron.find_section('E').order("id ")
    @patrons_f = Patron.find_section('F').order("id ")
    @patrons_g = Patron.find_section('G').order("id ")
    @patrons_h = Patron.find_section('H').order("id ")
    @patrons_i = Patron.find_section('I').order("id ")
    @patrons_j = Patron.find_section('J').order("id ")
    @patrons_k = Patron.find_section('K').order("id ")
    @patrons_l = Patron.find_section('L').order("id ")
    @patrons_m = Patron.find_section('M').order("id ")
    @patrons_n = Patron.find_section('N').order("id ")
    @patrons_o = Patron.find_section('O').order("id ")
    @patrons_p = Patron.find_section('P').order("id ")
    @patrons_q = Patron.find_section('Q').order("id ")
    @patrons_r = Patron.find_section('R').order("id ")
    @patrons_s = Patron.find_section('S').order("id ")
    @patrons_t = Patron.find_section('T').order("id ")

    @patrons_with = Patron.where(:status => true)
    @patron = Patron.all
    @my_patrons = Patron.find_reserve(session[:company_name]).order("id")

    @patrons_total = Patron.total_approved('yes').size
    @patrons_pending = Patron.total_pending('no',true).size
  end

  def update_status
     @patron = Patron.find(params[:id])
     @patron.update_attribute :approved, 'no'
     @patron.update_attribute :paid, 'no'
     respond_to do |format|
      if @patron.status == false
        if @patron.update_attribute :status, true
           @patron.update_attribute :company_name, session[:company_name]
           @patron.update_attribute :company_contact, session[:company_contact]
           @patron.update_attribute :company_email, session[:company_email]
           @patron.update_attribute :user_id, session[:id]
          #format.html { redirect_to @patrona, notice: 'patrona was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @patrona.errors, status: :unprocessable_entity }
        end
      else
        if @patron.update_attribute :status, false
           @patron.update_attribute :company_name, nil
           @patron.update_attribute :company_contact, nil
           @patron.update_attribute :company_email, nil
           @patron.update_attribute :user_id, nil
          #format.html { redirect_to @patrona, notice: 'patrona was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @patrona.errors, status: :unprocessable_entity }
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
    @my_patron = Patron.where(:company_name => session[:company_name])
  end

  def approved
    @patron = Patron.find(params[:id])
    @patron.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #UserMailer.send_mail(@patrona.company_email,@patrona.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @patron = Patron.find(params[:id])
     @patron.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

  def paid
     @patron = Patron.find(params[:id])
     @patron.update_attribute :paid, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

  def unpaid
    @patron = Patron.find(params[:id])
    @patron.update_attribute :paid, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end  
  end

end
