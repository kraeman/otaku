class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end
    
    def new
        @character = Character.new
    end
    
    def create
        byebug
        @character = Character.create(character_params)
        if @character.id
          session[:character_id] = @character.id
          redirect_to @character
        else
          render :new
        end
    end
    
    def show
        @character = Character.find(params[:id])
    end

    def edit
    end

    def update
        @character.update(character_params)
        if @character.valid?
            redirect_to @character
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def character_params
        params.require(:character).permit(:name, :bio, :show_id, :actor_id)
    end
end
