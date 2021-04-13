module CharactersHelper
    def display_show_portion_conditionally(f, character)
         if character.show_id == nil 

        
                f.label :show_id, class: "form-label"  
                f.collection_select :show_id, Show.all, :id, :title, prompt: true, class: "form-label" 
               
                content_tag(:h2, "Optionally create a show!")
                f.fields_for :show do |a| 
                    render partial: "shows/form", locals: {f: a} 
    
                 end 
        else 
                f.hidden_field :show_id, value: character.show_id 
        end 
    end

    def show_avatar(character)
        if character.avatar.attached?
            # <image src="<%=(url_for(@character.avatar))%>">
        end
    end
end
