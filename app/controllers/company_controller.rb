class CompanyController < ApplicationController

  def show_comp
    @user = User.find(params[:id])
    @reserves = Vipbbsrsbb.where(:company_name => @user.company_name)
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
    redirect_to(:controller => 'Vipbbsrsbb',:action => 'visual')
  end

end
