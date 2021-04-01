class ShowsController < ApplicationController
    def new
        @show = Show.new
    end
    
    def create
        @show = Show.create(show_params)
        if @show.id
          session[:show_id] = @show.id
          redirect_to @show
        else
          render :new
        end
    end
    
    def show
        @show = Show.find(params[:id])
    end

    def edit
    end

    def update
        @show.update(show_params)
        if @show.valid?
            redirect_to @show
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def show_params
        params.require(:show).permit(:title, :air_time, :rating)
    end
end
