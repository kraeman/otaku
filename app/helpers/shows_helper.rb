module ShowsHelper
    def display_shows_conditionally(shows)
        anime = ""
         if shows.any? 
             shows.uniq.each do |s| 
                anime << (link_to s.title, show_path(s)) + content_tag(:br)
             end
             anime.html_safe
        else 
                "No anime yet! Add one or check back later!"
        end

    end
    def iterate_through_comments(comments)
        coms = ""
        if comments.any?
            comments.reverse.each do |c|
               coms << "#{User.find_by_id(c.user_id).username}: " + " #{c.content} " + "#{c.created_at.strftime("%m/%d/%y: %H:%M %Z")}" +  "#{delete_if_admin_or_owner(c)}"
            end
            coms.html_safe
        else
            "No Comments Yet"
        end
    end
end
