class ViewingsController < ApplicationController
    def new
        @viewing = Viewing.new
    end
    
    def create
        @viewing = Viewing.create(viewing_params)
        if @viewing.id
          session[:viewing_id] = @viewing.id
          redirect_to @viewing
        else
          render :new
        end
    end
    
    def viewing
        @viewing = Viewing.find(params[:id])
    end

    def edit
    end

    def update
        @viewing.update(viewing_params)
        if @viewing.valid?
            redirect_to @viewing
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
