require 'aws-sdk-s3'  # v2: require 'aws-sdk'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  include S3ModuleHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
