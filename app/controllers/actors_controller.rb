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
        actor = Actor.find(params[:id])
        actor.update(actor_params)
        if actor.valid?
            redirect_to actor
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def actor_params
        params.require(:actor).permit(:name, :dob)
    end
end
