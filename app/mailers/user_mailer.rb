class UserMailer < ActionMailer::Base

  default :from => "ccarpio2818@gmail.com"

  def registration_confirmation(user="")
  	#@user = User.new(params[:user])
  	@user = user
  	@ticket = Vipbbsrsbb.where(:company_name => @user.company_name)
  	mail(:to => user.company_email, :subject => 'Registered')
  end

  #def send_mail(email,company_name)
  #	@company_email = email
  #	@company_name = company_name
  #	@tickets = Vipbbsrsbb.where(:company_name => @company_name)
  #	mail(:to => @company_email, :subject => 'Test')
  #end

  def send_mail(email,company_name)
    @company_email = email
    @company_name = company_name

    @vipbbsrsbbs = Vipbbsrsbb.where(:company_name => @company_name)
    @srsaavipaas = Srsaavipaa.where(:company_name => @company_name)
    @vipbbsrsbb = Vipbbsrsbb.where(:company_name => company_name)
    @srsaavipaas = Srsaavipaa.where(:company_name => company_name)
    @srsaas = Srsaa.where(:company_name => company_name)
    @csaas = Csaa.where(:company_name => company_name)
    @csas = Csa.where(:company_name => company_name)
    @srsas = Srsa.where(:company_name => company_name)
    @vipasrsas = Vipasrsa.where(:company_name => company_name)
    @srsbvipbs = Srsbvipb.where(:company_name => company_name)

    @lbdds = Lbdd.where(:company_name => company_name)
    @lbccs = Lbcc.where(:company_name => company_name)
    @lbbbs = Lbbb.where(:company_name => company_name)
    @lbaas = Lbaa.where(:company_name => company_name)
    @lbas = Lba.where(:company_name => company_name)
    @lbbs = Lbb.where(:company_name => company_name)
    @lbcs = Lbc.where(:company_name => company_name)
    @lbds = Lbd.where(:company_name => company_name)

    @all = @vipbbsrsbb.size + @srsaavipaas.size + @srsaas.size + @csaas.size + @csas.size + @srsas.size + @vipasrsas.size + @srsbvipbs.size + @lbdds.size + @lbccs.size + @lbbbs.size + @lbaas.size + @lbas.size + @lbbs.size + @lbcs.size + @lbds.size

    mail(:to => @company_email, :subject => 'Test')
  end

  def send_reserves(email,company_name)
    @company_email = email
    @company_name = company_name
    @tickets = Vipbbsrsbb.where(:company_name => @company_name)
    mail(:to => @company_email, :subject => 'Test')
  end

end
