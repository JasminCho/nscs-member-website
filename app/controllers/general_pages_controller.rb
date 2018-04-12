class GeneralPagesController < ApplicationController
    
    def home
      @newsfeed = Newsfeed.all
    end
  
    def about
    end
    
    def faq
    end
end
