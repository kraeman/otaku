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
    end
    
    def create
       if @character = Character.create(character_params)
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
