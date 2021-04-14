module SearchesHelper
    def display_search_results(results)
      rezults = ""
      if results.any?
         results.each do |r| 
             if r.class == Show 
                rezults << (link_to r.title, show_path(r)) + content_tag(:br)
             elsif r.class == Character 
                rezults << (link_to r.name, character_path(r)) + content_tag(:br)
             else 
               rezults << (link_to r.name, actor_path(r)) + content_tag(:br)             
            end 
         end
         rezults.html_safe
      else
         "Nothing matched your search!"
      end
    end
end
