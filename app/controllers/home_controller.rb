class HomeController < ApplicationController

  def index
    if signed_in?
      redirect_to news_path
    else
      @user = User.new
      @home = true
    end
  end
  
  def beta
    if signed_in?
      redirect_to news_path
    end
  end

end