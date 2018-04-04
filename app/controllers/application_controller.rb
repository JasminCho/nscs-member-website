class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :current_user
  helper_method :current_user, :logged_in?, :logged_in_user?
 
  def current_user
    #redirect_to sessions_create_path
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   
  end
  
  def logged_in?
	!current_user.nil?
  end

  #This method allow us to call selectively from controllers, instead of applying to all. 
  def logged_in_user?
	unless logged_in?
		flash[:danger] = "Please log in"
		redirect_to root_path
	end
  end

end
