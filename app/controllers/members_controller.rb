class MembersController < ApplicationController
    
    def home
        @newsfeed = Newsfeed.all
=begin
        if session[:user]
            if session[:user].admin == true
                @admin = true
            end
        end
=end
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
