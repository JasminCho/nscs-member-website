module MembersHelper
    def log_in(user)
        member = Member.find_by(email: user.email)
        if !member.nil?
            # session[:user_id] = user.id
        else
            # flash.now[:danger] = 'You are not a member!'
        end
    end
end
