class MembersController < ApplicationController

  def home
    @newsfeed = Newsfeed.all
  end

  def faq
  end

  def about
  end

  def officers
  end

  def contact
  end

  def meetings
  end

  def points
  end

  # members' methods
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(members_params)
    if @member.save
      redirect_to(members_index_path)
    else
      render 'new'
    end
  end

  private
  def members_params
    params.required(:member).permit(:name, :email, :admin, :pace)
  end
end
