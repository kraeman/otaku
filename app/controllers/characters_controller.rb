class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :index, :show, :edit]
    def index
        if params[:show_id]
            @characters = Character.find(params[:show_id]).characters
        else
            @characters = Character.all
        end
    end
    
    def new
        
        if params[:show_id] && @character = Show.find_by(id: params[:show_id])
            
            @character = Character.new(show_id: params[:show_id])
            
        else
            @character = Character.new
            @character.build_show
        end 
    end
    
    def create
        context_of_show_and_filled_out_correctly_and_security(character_params)       
    end
    
    def show
        @character = Character.find_by_id(params[:id])
        redirect_if_record_not_exist(@character)
    end

    def edit
        @character = Character.find_by_id(params[:id])
        @character.avatar.attach(params[:avatar])
        redirect_if_record_not_exist(@character)
    end

    def update
        character = Character.find(params[:id])
        character.update(character_params)
        if character.valid?
            redirect_to character
        else
            render :edit
        end
    end

    def destroy
        character = Character.find(params[:id])
        if character.destroy
            redirect_to characters_path
        else
            redirect_to back
        end
    end
    
    private
    
    def character_params
        params.require(:character).permit(:name, :bio, :actor_id, :show_id, :avatar, show_attributes: [:title, :air_time, :show_id, :id])
    end

    def context_of_show?
        !character_params[:show_id]
    end

    def filled_out_form_correctly_in_context_of_show?
        character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != ""    end

    def hacked?
        character_params[:show_attributes][:show_id] != character_params[:show_attributes][:id]
    end

    def filled_out_form_correctly?
        character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != "" && (character_params[:show_id] != "" || (character_params[:show_attributes][:title] != "" && character_params[:show_attributes][:rating] != "" && character_params[:show_attributes][:air_time] != ""))    end

    def selected_show_from_dropdown?
        character_params[:show_id] != ""
    end

    def context_of_show_and_filled_out_correctly_and_security(character_params)
        if context_of_show?
            if filled_out_form_correctly_in_context_of_show?
                if hacked?
                    redirect_to new_show_character_path(Show.find(character_params[:show_attributes][:id]))
                else
                    @character = Character.create(name: character_params[:name], bio: character_params[:bio], actor_id: character_params[:actor_id], show_id: character_params[:show_attributes][:id])
                    redirect_to show_character_path(Show.find(character_params[:show_attributes][:id]), @character)
                end
            else
                @character = Character.create(name: character_params[:name], bio: character_params[:bio], actor_id: character_params[:actor_id], show_id: character_params[:show_attributes][:id])
                render :new
            end
        else             
                if filled_out_form_correctly?
                    if selected_show_from_dropdown?
                        @character = Character.create(name: character_params[:name], bio: character_params[:bio], show_id: character_params[:show_id], actor_id: character_params[:actor_id])
                        redirect_to @character
                    else
                        @character = Character.create(character_params)
                        redirect_to @character
                    end
                else
                 @character = Character.create(character_params)
                 render :new
                end  
        end
    end


end
