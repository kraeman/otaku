module CharactersHelper
    def display_show_portion_conditionally(f, character)
    #    byebug
         if character.show_id
            render partial: 'characters/thing2', locals: {f: f}
            
        else 
                 render partial: 'characters/thing1', locals: {f: f}
        end 
    end

    def show_avatar(character)
        if character.avatar.attached?
            # <image src="=(url_for(@character.avatar))">
        end
    end
end
