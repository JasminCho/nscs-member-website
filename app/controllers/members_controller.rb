class MembersController < ApplicationController
    
    def login
        @newsfeeds = Newsfeed.all
    end
    
    def home
    end
    
    def faq
    end
    
    def about
    end
end
