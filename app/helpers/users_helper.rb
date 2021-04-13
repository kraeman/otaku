module UsersHelper
    def user_error_show?(user)
        if !user
            "Login Error"
        end
    end

    def created_via_omni?(user, f)
         if !user.cvo
            render partial: "form2", locals: {f: f}
         end
    end
end
