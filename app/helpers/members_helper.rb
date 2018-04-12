module MembersHelper
    
    def member? user_email
        member = Member.find_by(email: user_email)
        if member.nil?
            return false
        else
            return true
        end
    end
    
    def admin_user? 
        user = Officer.find_by(email: session[:email])
        if user.nil?
            redirect_to(home_url)
            flash.now[:danger] = 'You are not an admin!'
        else
            unless user.admin
                redirect_to(root_url)
                flash.now[:danger] = 'You are not an admin!'
            end
        end
    end
end
