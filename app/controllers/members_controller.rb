class MembersController < ApplicationController
    
    def home
        @newsfeeds = Newsfeed.all
    end
    
    def faq
    end
    
    def about
    end

    def officers
    end
    
    def contact
    end
end
