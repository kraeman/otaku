module UsersHelper
    def user_error_show?(user)
        if !user
            "Login Error"
        end
    end

    def created_via_omni?(user, f)
         if !user.cvo
            render partial: "context_of_show", locals: {f: f}
         end
    end


    def iterate_through_user_shows(user)
        showz = ""
        if @user.shows.any?
             @user.shows.uniq.each do |showy| 
                showz << (link_to showy.title, show_path(showy)) + content_tag(:br)
             end
             showz.html_safe
         else 
            "You currently have no anime!"
         end
    end
end
