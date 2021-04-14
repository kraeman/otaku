class CharactersController < ApplicationController
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
        # byebug
        if !character_params[:show_id]
            if character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != ""
                if character_params[:show_attributes][:show_id] != character_params[:show_attributes][:id]
                    
                    redirect_to new_show_character_path(Show.find(character_params[:show_attributes][:id]))
                else
                    # byebug
                    @character = Character.create(name: character_params[:name], bio: character_params[:bio], actor_id: character_params[:actor_id], show_id: character_params[:show_attributes][:id])
                    redirect_to show_character_path(Show.find(character_params[:show_attributes][:id]), @character)
                end
            else
                
                @character = Character.create(character_params)
                render :new
            end
        else             
                if character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != "" && (character_params[:show_id] != "" || (character_params[:show_attributes][:title] != "" && character_params[:show_attributes][:rating] != "" && character_params[:show_attributes][:air_time] != ""))
                    if character_params[:show_id] != ""
                        # byebug
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
    
    def show
        @character = Character.find(params[:id])
    end

    def edit
        @character = Character.find(params[:id])
        @character.avatar.attach(params[:avatar])
    end

    def update
        # byebug
        character = Character.find(params[:id])
        character.update(character_params)
        if character.valid?
            redirect_to character
        else
            render :edit
        end
    end

    def destroy
        # byebug
        character = Character.find(params[:id])
        # byebug
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

    def no_show_attributes_in_character_params?
        !character_params[:show_attributes]
    end

    def character_params_filled_out?
        character_params[:name] != "" && character_params[:bio] != "" && character_params[:actor_id] != ""
    end

    def hacked?
        params[:show_id] != character_params[:show_id]
    end

    def character_params_filled_out_with_show_attributes?
        character_params_filled_out? && (character_params[:show_id] != "" || (character_params[:show_attributes][:title] != "" && character_params[:show_attributes][:rating] != "" && character_params[:show_attributes][:air_time] != ""))
    end

    def show_id_in_character_params
        character_params[:show_id] != ""
    end


end
