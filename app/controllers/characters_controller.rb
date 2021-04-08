class CharactersController < ApplicationController
    def index
        if params[:show_id]
            @characters = Show.find(params[:show_id].characters)
        else
            @characters = Character.all
        end
    end
    
    def new
        if params[:show_id] && @show = Show.find(params[:show_id])
            @character = Character.new(show_id: params[:show_id])
        else
            @character = Character.new
        end
        # byebug
    end
    
    def create
        @character = Character.create(character_params)
        # byebug
       
        #   session[:character_id] = @character.id
        if params[:show_id] && @character.show_id == params[:show_id].to_i && @character.id
            redirect_to show_character_path(params[:show_id], @character.id)
        elsif @character.id
            redirect_to @character
            
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
    
    def character_params
        params.require(:character).permit(:name, :bio, :show_id, :actor_id, :avatar)
    end
end
