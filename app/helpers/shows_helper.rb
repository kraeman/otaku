module ShowsHelper
    def display_shows_conditionally(shows)
         if shows.any? 
             shows.each do |s| 
                 render partial: 'shows/test', locals: {s: s}
             end 
             else 
                "No anime yet! Add one or check back later!"
             end 
    end
end
