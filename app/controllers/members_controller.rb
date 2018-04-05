class MembersController < ApplicationController
    
    def home
        @newsfeed = Newsfeed.all
    end
    
    def faq
        objs = S3ModuleHelper::s3_get_buckets
        byebug
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

    end
end
