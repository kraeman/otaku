class ViewingsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :index, :show, :edit]
    def new
        @viewing = Viewing.new
    end

    def index
        @user = User.find(session[:user_id])
    end

    
    def create
        @viewing = Viewing.create(time: viewing_params[:time], place: viewing_params[:place], show_id: viewing_params[:show_id], user_id: session[:user_id])
        if @viewing.id
          session[:viewing_id] = @viewing.id
          redirect_to @viewing.user
        else
          render :new
        end
    end

    def edit
        @viewing = Viewing.find_by_id(params[:id])
        redirect_if_record_not_exist(@viewing)
    end

    def update
        @viewing = Viewing.find(params[:id])
        @viewing.update(viewing_params)
        if @viewing.valid?
            redirect_to user_path(@viewing.user)
        else
            render :edit
        end
    end

    def destroy
        viewing = Viewing.find(params[:id])
        if viewing.user_id == session[:user_id]
            if viewing.destroy
                redirect_to user_path(session[:user_id])
            else
                redirect_to back
            end
        else
            redirect_to user_path(session[:user_id])
        end
    end
    
    private
    
    def viewing_params
        params.require(:viewing).permit(:time, :place, :show_id, :user_id)
    end
end
