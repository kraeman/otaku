module UsersHelper
    def user_error_show?(user)
        if !user
            "Login Error"
        end
    end
end
