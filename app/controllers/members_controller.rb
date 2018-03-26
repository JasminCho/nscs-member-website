class MembersController < ApplicationController
    
    def home
        @newsfeed = Newsfeed.all
        if session[:user].admin == true
            @admin = true
        end
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
end
