class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_user2
  include MembersHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  
  # julian will delete this once current_user is established
  def current_user2
    @current_user2 ||= Member.find_by(email: session[:email]) if session[:email]
  end

end
