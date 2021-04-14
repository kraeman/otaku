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
end
