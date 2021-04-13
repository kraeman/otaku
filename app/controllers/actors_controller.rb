class ActorsController < ApplicationController
    def new
        @actor = Actor.new
    end

    def index
        @actors = Actor.all
    end
    
    def create
        @actor = Actor.create(actor_params)
        if @actor.id
          session[:actor_id] = @actor.id
          redirect_to @actor
        else
          render :new
        end
    end
    
    def show
        @actor = Actor.find(params[:id])
    end

    def edit
        @actor = Actor.find(params[:id])
    end

    def update
        @actor = Actor.find(params[:id])
        @actor.update(actor_params)
        if @actor.valid?
            redirect_to @actor
        else
            render :edit
        end
    end

    def destroy
        # byebug
        actor = Actor.find(params[:id])
        # byebug
        if actor.destroy
            redirect_to actors_path
        else
            redirect_to back
        end
    end
    
    private
    
    def actor_params
        params.require(:actor).permit(:name, :dob)
    end
end
