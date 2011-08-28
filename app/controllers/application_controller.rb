class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user  
  helper_method :authenticate
  
  private  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    redirect_to login_url unless current_user
  end
end
