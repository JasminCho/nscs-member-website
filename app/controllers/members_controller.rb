class MembersController < ApplicationController
  
  before_action :admin_user?

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    debugger
    @member = Member.new(members_params)
    if @member.save
      redirect_to(members_index_path)
    else
      flash[:invalid_member] = 'Invalid member attributes. Try again!'
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(members_params)
      redirect_to members_url(:id => @member.id)
    else 
      flash[:invalid_member] = 'Invalid member attributes. Try again!'
      render 'edit'
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @member = Member.find(id) # look up movie by unique ID
  end

  def destroy
    id = params[:id]
    @member = Member.find(id)
    @member.destroy

    redirect_to members_index_path
  end

  private

  def members_params
    params.require(:member).permit(:name, :email, :pace)
  end
end
