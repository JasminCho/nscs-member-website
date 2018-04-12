class PointsController < ApplicationController
  def index
    member_email = params[:email]
    @points = Point.where(email: member_email)
    debugger

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end