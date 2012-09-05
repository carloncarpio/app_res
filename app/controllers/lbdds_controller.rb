class LbddsController < ApplicationController
  # GET /lbdds
  # GET /lbdds.json
  def index
    @lbdds = Lbdd.all
    @lbdds = Lbdd.where(:section => 'A')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lbdds }
    end
  end

  def index_b
    @lbdds = Lbdd.where(:section => 'B')
  end
  def index_c
    @lbdds = Lbdd.where(:section => 'C')
  end
  def index_d
    @lbdds = Lbdd.where(:section => 'D')
  end
  def index_e
    @lbdds = Lbdd.where(:section => 'E')
  end
   def index_f
    @lbdds = Lbdd.where(:section => 'F')
  end
   def index_g
    @lbdds = Lbdd.where(:section => 'G')
  end
   def index_h
    @lbdds = Lbdd.where(:section => 'H')
  end
   def index_i
    @lbdds = Lbdd.where(:section => 'I')
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
        format.html { redirect_to @lbdd, notice: 'Lbdd was successfully created.' }
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
        format.html { redirect_to @lbdd, notice: 'Lbdd was successfully updated.' }
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
      format.json { head :no_content }
    end
  end

  def visual
    @lbdds_a = Lbdd.find_section('A')
    @lbdds_b = Lbdd.find_section('B')
    @lbdds_c = Lbdd.find_section('C')
    @lbdds_d = Lbdd.find_section('D')
    @lbdds_e = Lbdd.find_section('E')
    @lbdds_f = Lbdd.find_section('F')
    @lbdds_g = Lbdd.find_section('G')
    @lbdds_h = Lbdd.find_section('H')
    @lbdds_i = Lbdd.find_section('I')

    @lbdds_with = Lbdd.where(:status => true)
    @lbdds = Lbdd.all
    @my_lbdds = Lbdd.find_reserve(session[:company_name])
  end

  def update_status
     @vipbbsrsbb = Vipbbsrsbb.find(params[:id])

     respond_to do |format|
      if @vipbbsrsbb.status == false
        if @vipbbsrsbb.update_attribute :status, true
           @vipbbsrsbb.update_attribute :company_name, session[:company_name]
           @vipbbsrsbb.update_attribute :company_contact, session[:company_contact]
           @vipbbsrsbb.update_attribute :company_email, session[:company_email]
           @vipbbsrsbb.update_attribute :user_id, session[:id]
          #format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully updated.' }
          #format.json { head :no_content }
          format.js 
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
        end
      else
        if @vipbbsrsbb.update_attribute :status, false
           @vipbbsrsbb.update_attribute :company_name, nil
           @vipbbsrsbb.update_attribute :company_contact, nil
           @vipbbsrsbb.update_attribute :company_email, nil
           @vipbbsrsbb.update_attribute :user_id, nil
          #format.html { redirect_to @vipbbsrsbb, notice: 'Vipbbsrsbb was successfully updated.' }
          #format.json { head :no_content }
           format.js
        else
          #format.html { render action: "edit" }
          #format.json { render json: @vipbbsrsbb.errors, status: :unprocessable_entity }
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
    @my_vipbbsrsbbs = Vipbbsrsbb.where(:company_name => session[:company_name])
  end

  def approved
    @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
    @vipbbsrsbb.update_attribute :approved, 'yes'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      UserMailer.send_mail(@vipbbsrsbb.company_email,@vipbbsrsbb.company_name).deliver
      #format.json { head :no_content }
      #format.js 
    end
  end

  def disapproved
     @vipbbsrsbb = Vipbbsrsbb.find(params[:id])
     @vipbbsrsbb.update_attribute :approved, 'no'

    respond_to do |format|
      format.html { redirect_to :action => 'visual' }
      #format.json { head :no_content }
      #format.js 
    end
  end

end
