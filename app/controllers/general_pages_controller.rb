class GeneralPagesController < ApplicationController
    
    before_action :admin_user?, only: [:AdminPage]
    
    def home
      @newsfeed = Newsfeed.all
    end
  
    def about
    end
    
    def faq
    end
    
    def admin_page
    end
end
