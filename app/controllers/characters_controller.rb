class CharactersController < ApplicationController
    def index
        if params[:show_id]
            @characters = Show.find(params[:show_id]).characters
        else
            @characters = Character.all
        end
    end
    
    def new
        @character = Character.new
        @character.build_show
    end
    
    def create
        byebug
        
        if character_params[:show_id] != nil || (nested_character_params[:show_attributes][:title] != nil && nested_character_params[:show_attributes][:air_time] != nil && nested_character_params[:show_attributes][:rating] != nil)
            if character_params[:show_id] != ""
                @character = Character.create(character_params)
                redirect_to @character
            else
                @character = Character.create(nested_character_params)
                redirect_to @character
            end
       else
            render :new 
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
    end
    
    private
    
    def nested_character_params
        params.require(:character).permit(:name, :bio, :actor_id, :avatar, show_attributes: [:title, :rating, :air_time])
    end

    def character_params
        params.require(:character).permit(:name, :bio, :show_id, :actor_id, :avatar)
    end
end
