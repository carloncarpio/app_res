class CompanyController < ApplicationController

  def show_comp
    @user = User.find(params[:id])
    @vipbbsrsbbs = Vipbbsrsbb.where(:company_name => @user.company_name)
    @srsaavipaas = Srsaavipaa.where(:company_name => @user.company_name)
    @srsaas = Srsaa.where(:company_name => @user.company_name)
    @csaas = Csaa.where(:company_name => @user.company_name)
    @csas = Csa.where(:company_name => @user.company_name)
    @srsas = Srsa.where(:company_name => @user.company_name)
    @vipasrsas = Vipasrsa.where(:company_name => @user.company_name)
    @srsbvipbs = Srsbvipb.where(:company_name => @user.company_name)

    @lbdds = Lbdd.where(:company_name => @user.company_name)
    @lbccs = Lbcc.where(:company_name => @user.company_name)
    @lbbbs = Lbbb.where(:company_name => @user.company_name)
    @lbaas = Lbaa.where(:company_name => @user.company_name)
    @lbas = Lba.where(:company_name => @user.company_name)
    @lbbs = Lbb.where(:company_name => @user.company_name)
    @lbcs = Lbc.where(:company_name => @user.company_name)
    @lbds = Lbd.where(:company_name => @user.company_name)

    @all = @vipbbsrsbbs.size + @srsaavipaas.size + @srsaas.size + @csaas.size + @csas.size + @srsas.size + @vipasrsas.size + @srsbvipbs.size + @lbdds.size + @lbccs.size + @lbbbs.size + @lbaas.size + @lbas.size + @lbbs.size + @lbcs.size + @lbds.size

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

end
