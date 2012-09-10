class AccessController < ApplicationController

  def index
  	login
  	render('login')
  end

  def login
  end

  def attempt_login
  	if authorize_user = User.authenticate(params[:username],params[:password])
  		session[:username] = authorize_user.username
  		session[:id] = authorize_user.id
  		session[:company_name] = authorize_user.company_name
  		session[:company_email] = authorize_user.company_email
  		session[:company_contact] = authorize_user.company_contact
  		#redirect_to(:controller => 'Vipbbsrsbbs', :action => 'visual')
      if authorize_user.username == 'admin'
        redirect_to :action => 'public'
      else
        redirect_to :action => 'public'
      end
  	else
      flash[:notice] = 'Invalid Username/Password'
  		redirect_to(:action => 'index')
  	end
  end

  def menu
  end

  def logout
    session[:username] = nil
    session[:id] = nil
    session[:company_name] = nil
    session[:company_email] = nil
    session[:company_contact] = nil
    redirect_to :controller => 'access', :action => 'index'
  end

  def public
    @vipbbsrsbbs_all = Vipbbsrsbb.all
    @vipbbsrsbbs = Vipbbsrsbb.where(:status => true)

    @srsaavipaas_all  = Srsaavipaa.all
    @srsaavipaas      = Srsaavipaa.where(:status => true)

    @srsaas_all = Srsaavipaa.all
    @srsaas = Srsaavipaa.where(:status => true)

    @srsas_all = Srsa.all
    @srsas = Srsa.where(:status => true)

    @lbdds_all = Lbdd.all
    @lbdds = Lbdd.where(:status => true)

    @lbccs_all = Lbcc.all
    @lbccs = Lbcc.where(:status => true)

    @lbbbs_all = Lbbb.all
    @lbbbs = Lbbb.where(:status => true)

    @lbaas_all = Lbaa.all
    @lbaas = Lbaa.where(:status => true)

    @lbas_all = Lba.all
    @lbas = Lba.where(:status => true)

    @lbbs_all = Lbb.all
    @lbbs = Lbb.where(:status => true)

    @lbcs_all = Lbb.all
    @lbcs = Lbb.where(:status => true)

    @lbds_all = Lbd.all
    @lbds = Lbd.where(:status => true)

    @csaas_all = Csaa.all
    @csaas = Csaa.where(:status => true)

    @csas_all = Csa.all
    @csas = Csa.where(:status => true)

    @vipasrsas_all = Vipasrsa.all
    @vipasrsas = Vipasrsa.where(:status => true)

    @srsbvipbs_all = Srsbvipb.all
    @srsbvipbs = Srsbvipb.where(:status => true)

  end

  def admin
  end

end
