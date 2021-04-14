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

    def context_of_show?(character_params)
        !character_params[:show_id]
    end

    def filled_out_form_correctly_in_context_of_show?(character_params)
        character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != ""    end

    def hacked?(character_params)
        character_params[:show_attributes][:show_id] != character_params[:show_attributes][:id]
    end

    def filled_out_form_correctly?(character_params)
        character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != "" && (character_params[:show_id] != "" || (character_params[:show_attributes][:title] != "" && character_params[:show_attributes][:rating] != "" && character_params[:show_attributes][:air_time] != ""))    end

    def selected_show_from_dropdown?(character_params)
        character_params[:show_id] != ""
    end

    def context_of_show_and_filled_out_correctly_and_security(character_params)
        if context_of_show?(character_params) && filled_out_form_correctly_in_context_of_show?(character_params)
                return Character.create(name: character_params[:name], bio: character_params[:bio], actor_id: character_params[:actor_id], show_id: character_params[:show_attributes][:id])
        else             
                    if selected_show_from_dropdown?(character_params)
                        return Character.create(name: character_params[:name], bio: character_params[:bio], show_id: character_params[:show_id], actor_id: character_params[:actor_id])
                    else
                        return Character.create(character_params)
                    end
        end
    end

    def find_in_context_of_show(character_params)
        Show.find(character_params[:show_attributes][:id])
    end

    def find_in_context_of_show_but_not_hacked(character_params)
        Show.find(character_params[:show_attributes][:id])
    end

end
