module ViewingsHelper
    def iterate_through_user_future_viewings(user)
        future_views = ""
         if user.viewings.any? { |v| v.time >= Time.now } 
             user.viewings.each do |viewing| 
               if viewing.time >= Time.now 
                future_views << "#{link_to viewing.show.title, show_path(viewing.show)}" + " " + "#{link_to "#{viewing.time.strftime("%m/%d/%y: %H:%M %Z")} @ #{viewing.place}", edit_viewing_path(viewing)}" + "#{content_tag(:br)}" 
               end 
             end 
             future_views.html_safe
        else 
            "You have no upcoming viewings!"
        end 
    end

    def iterate_through_user_past_viewings(user)
        past_views = ""
         if user.viewings.any? { |v| v.time < Time.now } 
             user.viewings.each do |viewing| 
                 if viewing.time < Time.now 
                    past_views << "#{link_to viewing.show.title, show_path(viewing.show)}" + " " + "#{link_to "#{viewing.time.strftime("%m/%d/%y: %H:%M %Z")} @ #{viewing.place}", edit_viewing_path(viewing)}" + "#{content_tag(:br)}" 

                 end 
               end
               past_views.html_safe 
               else 
                "No viewing History!"
               end 
    end

end
