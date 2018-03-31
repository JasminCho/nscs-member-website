class NewsfeedsController < ApplicationController
  def index
    @newsfeeds = Newsfeed.all
  end
  
  def show
  end
  
  def new
    @newsfeeds = Newsfeed.new
  end

  def create
    @newsfeeds = Newsfeed.new(newsfeeds_params)
    if @newsfeeds.save
      redirect_to(newsfeeds_index_path)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def newsfeeds_params 
    params.require(:newsfeed).permit(:news)
  end
end
