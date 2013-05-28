class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session]
      user = User.find_by_email(params[:session][:email].downcase)
      @pass = params[:session][:password]
    else
      user = User.find_by_email(params[:email].downcase)
      @pass = params[:password]
    end
    if user && user.authenticate(@pass)
      if user.authentic_email
        sign_in user
        redirect_to news_path
      else
        flash[:notice] = "You have not verified your email adress.\n "
        redirect_to root_url(:email_attempt => user.email)
      end
    else
      flash[:error] = 'The email or password you entered is incorrect.'
      redirect_to root_url
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end

end
