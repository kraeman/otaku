class ShowsController < ApplicationController
    def new
        @show = Show.new
        @show.characters.build
    end

    def index
        @shows = Show.all
    end
    
    def create
        # byebug
        @show = Show.create(show_params)
        if @show.id
          session[:show_id] = @show.id
          redirect_to @show
        else
            @show.characters.build
            render :new
        end
    end
    
    def show
        @show = Show.find(params[:id])
    end

    def edit
        @show = Show.find(params[:id])
    end

    def update
        # byebug
        show = Show.find(params[:id])
        show.update(show_params)
        if show.valid?
            redirect_to show
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def show_params
        params.require(:show).permit(:title, :air_time, :rating, characters_attributes: [
            :name,
            :bio,
            :actor_id,
            :avatar
          ])
    end
end
