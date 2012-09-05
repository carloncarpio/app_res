class UserMailer < ActionMailer::Base

  default :from => "ccarpio2818@gmail.com"

  def registration_confirmation(user="")
  	#@user = User.new(params[:user])
  	@user = user
  	@ticket = Vipbbsrsbb.where(:company_name => @user.company_name)
  	mail(:to => user.company_email, :subject => 'Registered')
  end

  def send_mail(email,company_name)
  	@company_email = email
  	@company_name = company_name
  	@tickets = Vipbbsrsbb.where(:company_name => @company_name)
  	mail(:to => @company_email, :subject => 'Test')
  end

end
