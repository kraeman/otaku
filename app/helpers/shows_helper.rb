module ShowsHelper
    def display_shows_conditionally(shows)
         if shows.any? 
             shows.each do |s| 
                (link_to s.title, show_path(s))
             end 
             else 
                "No anime yet! Add one or check back later!"
             end 
    end
end
