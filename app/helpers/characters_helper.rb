module CharactersHelper
    def display_show_portion_conditionally(f, character)
    #    byebug
         if character.show_id
            render partial: 'characters/context_of_show', locals: {f: f}
            
        else 
                 render partial: 'characters/out_of_show', locals: {f: f}
        end 
    end

    def show_avatar(character)
        if character.avatar.attached?
             image_tag(url_for(@character.avatar))
        end
    end

    def iterate_through_characters(characters)
        charac = ""
         if characters.any? 
             characters.each do |c| 
                charac << (link_to c.name, character_path(c)) + content_tag(:br)
             end
             charac.html_safe
        else 
                "No characters yet! Add one or check back later!"
        end
    end
end
