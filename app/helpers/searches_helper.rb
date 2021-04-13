module SearchesHelper
    def display_search_results(results)
         results.each do |r| 
             if r.class == Show 
                content_tag(li: (link_to r.title, show_path(r)))
             elsif r.class == Character 
                content_tag(li: (link_to r.name, character_path(r)))
             else 
                content_tag(li: (link_to r.name, actor_path(r)))
             end 
         end 
    end
end
