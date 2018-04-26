class PointsController < ApplicationController
  
  before_action :admin_user?, only: [:new, :destroy]
  
  def index
    if (current_member.email == params[:email]) || (current_admin)
      session[:member_email] = params[:email]
      @member_email = session[:member_email]
      @point = Point.where(email: @member_email)
      @name_of_member = Member.find_by(email: @member_email).name
    else
      flash[:danger] = "You cannot view another member's points"
      redirect_to(points_index_path(:email => current_member.email))
    end
  end

  def new
    @member_email = session[:member_email]
    @point = Point.new
  end

  def create
    @member_email = session[:member_email]
    @point = Point.new(points_params)
    if @point.save
      redirect_to(points_index_path(:email => points_params[:email]))
    else
      render 'new'
    end
  end

  def destroy
    id = params[:id]
    email = params[:email]
    @point = Point.find(id)
    @point.destroy
    
    redirect_to points_index_url(:email => email)
  end

  private 
  def points_params
    params.require(:point).permit(:email, :event_name, :point)
  end

end