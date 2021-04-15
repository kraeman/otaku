class ShowsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :index, :show, :edit]
    
    def new
        @show = Show.new
    end

    def index
        @shows = Show.all
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
        @show = Show.find_by_id(params[:id])
        @comment = Comment.new
        redirect_if_record_not_exist(@show)
    end

    def edit
        @show = Show.find_by_id(params[:id])
        redirect_if_record_not_exist(@show)
    end

    def update
        @show = Show.find(params[:id])
        @show.update(show_params)
        if @show.valid?
            redirect_to @show
        else
            render :edit
        end
    end

    def destroy
        show = Show.find(params[:id])
        if show.destroy
            redirect_to shows_path
        else
            redirect_to back
        end
    end
    
    private
    
    def show_params
        params.require(:show).permit(:title, :air_time)
    end
end
