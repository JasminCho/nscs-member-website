class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :current_user
  helper_method :current_user, :logged_in?, :logged_in_user?

  def current_user
    #redirect_to sessions_create_path
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    redirect_to root_path
  end
  
  def logged_in?
	!@current_user.nil?
  end
  
  def logged_in_user?
	unless logged_in?
		flash[:danger] = "Please log in"
		redirect_to home_path
	end
  end

end
