class ViewingsController < ApplicationController
    def new
        @viewing = Viewing.new
    end

    
    def create
        # byebug
        @viewing = Viewing.create(time: viewing_params[:time], place: viewing_params[:place], show_id: viewing_params[:show_id], user_id: session[:user_id])
        # byebug
        if @viewing.id
          session[:viewing_id] = @viewing.id
          redirect_to @viewing.user
        else
          render :new
        end
    end
    
    def viewing
        @viewing = Viewing.find(params[:id])
    end

    def edit
        # byebug
        @viewing = Viewing.find(params[:id])
    end

    def update
        # byebug
        viewing = Viewing.find(params[:id])
        viewing.update(viewing_params)
        if viewing.valid?
            redirect_to user_path(viewing.user)
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def viewing_params
        params.require(:viewing).permit(:time, :place, :show_id, :user_id)
    end
end
