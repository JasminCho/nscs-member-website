class NewsfeedsController < ApplicationController
  
  before_action :admin_user?
  
  def index
    @newsfeeds = Newsfeed.all
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
    @newsfeeds = Newsfeed.find(params[:id])
  end

  def update
    @newsfeeds = Newsfeed.find(params[:id])
    if @newsfeeds.update_attributes(newsfeeds_params)
      flash[:success] = "Newsfeed updated"
      redirect_to(newsfeeds_index_path)
    else
      render 'edit'
    end
  end

  def destroy
    Newsfeed.find(params[:id]).destroy
    flash[:success] = "News deleted"
    redirect_to newsfeeds_index_path
  end
  
  private
  
  def newsfeeds_params 
    params.require(:newsfeed).permit(:news)
  end
end
