class CompanyController < ApplicationController

  before_filter :confirm_logged_in

  def show_comp
    @user = User.find(params[:id])
    @vipbbsrsbbs = Vipbbsrsbb.where(:company_name => @user.company_name).order("ticket_num")
    @srsaavipaas = Srsaavipaa.where(:company_name => @user.company_name).order("ticket_num")
    @srsaas = Srsaa.where(:company_name => @user.company_name).order("ticket_num")
    @csaas = Csaa.where(:company_name => @user.company_name).order("ticket_num")
    @csas = Csa.where(:company_name => @user.company_name).order("ticket_num")
    @srsas = Srsa.where(:company_name => @user.company_name).order("ticket_num")
    @vipasrsas = Vipasrsa.where(:company_name => @user.company_name).order("ticket_num")
    @srsbvipbs = Srsbvipb.where(:company_name => @user.company_name).order("ticket_num")

    @lbdds = Lbdd.where(:company_name => @user.company_name).order("ticket_num")
    @lbccs = Lbcc.where(:company_name => @user.company_name).order("ticket_num")
    @lbbbs = Lbbb.where(:company_name => @user.company_name).order("ticket_num")
    @lbaas = Lbaa.where(:company_name => @user.company_name).order("ticket_num")
    @lbas = Lba.where(:company_name => @user.company_name).order("ticket_num")
    @lbbs = Lbb.where(:company_name => @user.company_name).order("ticket_num")
    @lbcs = Lbc.where(:company_name => @user.company_name).order("ticket_num")
    @lbds = Lbd.where(:company_name => @user.company_name).order("ticket_num")
    @patrons = Patron.where(:company_name => @user.company_name).order("ticket_num")

    @all = @vipbbsrsbbs.size + @srsaavipaas.size + @srsaas.size + @csaas.size + @csas.size + @srsas.size + @vipasrsas.size + @srsbvipbs.size + @lbdds.size + @lbccs.size + @lbbbs.size + @lbaas.size + @lbas.size + @lbbs.size + @lbcs.size + @lbds.size + @patrons.size

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def send_reserve
    @user = User.find(params[:id])
   	#@user = User.where(:id => params[:id])
   	#@vipbbsrsbb = Vipbbsrsbb.find(params[:company_email])
    
    UserMailer.send_mail(@user.company_email,@user.company_name).deliver
    #@email = Vipbbsrsbb.all
    #@comp = Vipbbsrsbb.all
    #UserMailer.send_reserves(@email,@comp).deliver
    redirect_to(:controller => 'access',:action => 'public')
  end
#jing.almaden@peoplesparxph.com

  def submit_res
    @user = User.find(params[:id])
    #@user = User.where(:id => params[:id])
    #@vipbbsrsbb = Vipbbsrsbb.find(params[:company_email])
    
    UserMailer.mysubmit(@user.company_email,@user.company_name).deliver
    #@email = Vipbbsrsbb.all
    #@comp = Vipbbsrsbb.all
    #UserMailer.send_reserves(@email,@comp).deliver
    redirect_to(:controller => 'access',:action => 'public')
  end

end
