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

  end
end
