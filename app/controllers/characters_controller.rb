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
       @character = helpers.context_of_show_and_filled_out_correctly_and_security(character_params)
        if helpers.context_of_show?(character_params) && helpers.filled_out_form_correctly_in_context_of_show?(character_params)
                if helpers.hacked?(character_params)
                    redirect_to new_show_character_path(Character.find_in_context_of_show(character_params))
                else
                    redirect_to show_character_path(Character.find_in_context_of_show_but_not_hacked(character_params), @character)
                end
        elsif @character.valid?
            redirect_to @character
        else
            render :new
        end       
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
        @character = Character.find(params[:id])
        @character.update(character_params)
        if @character.valid?
            redirect_to @character
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


end
