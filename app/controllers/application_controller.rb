require 'aws-sdk-s3'  # v2: require 'aws-sdk'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :current_user, :current_admin
  helper_method :current_user,:logged_in?, :logged_in_user?
  include MembersHelper
  include S3ModuleHelper

  def current_user
    #redirect_to sessions_create_path
    @current_user ||= Member.find_by(email: session[:email]) if session[:email]
  end
  
  def current_admin
    @current_admin ||= Officer.find_by(email: session[:email]) if session[:email]
  end

  def current_member
    @member ||= Member.find_by(email: session[:email]) if session[:email]
  end

  def current_admin
    @admin ||= Officer.find_by(email: session[:admin_email]) if session [:admin_email]
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
