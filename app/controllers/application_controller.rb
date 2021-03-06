require 'aws-sdk-s3'  # v2: require 'aws-sdk'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :current_user, :current_admin, :current_member
  helper_method :current_user,:logged_in?, :logged_in_user?, :current_member, :current_admin
  include MembersHelper
  include S3ModuleHelper

  def current_user
    #redirect_to sessions_create_path
    @current_user ||= User.find_by(email: session[:email]) if session[:email]
  end
  
  def current_admin
    @current_admin ||= Officer.find_by(email: session[:email]) if session[:email]
  end

  def current_member
    @current_member ||= Member.find_by(email: session[:email]) if session[:email]
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

  def logged_in_admin?
    unless !current_admin.nil?
      flash[:danger] = "Need to be an admin to access this page."
      redirect_to root_path
    end
  end

end
