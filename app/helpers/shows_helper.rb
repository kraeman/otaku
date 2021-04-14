module ShowsHelper
    def display_shows_conditionally(shows)
        anime = ""
         if shows.any? 
             shows.each do |s| 
                anime << (link_to s.title, show_path(s)) + content_tag(:br)
             end
             anime.html_safe
        else 
                "No anime yet! Add one or check back later!"
        end

    end
end
