class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show, :edit]
    before_action :redirect_if_logged_in, only: [:new]

    def new
        @user = User.new
        render :layout => false
    end
    
    def create
        @user = User.create(user_params)
        if @user.id
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            render :new, :layout => false
        end
    end
    
    def show
       
        @user = User.find_by(id: session[:user_id])
        if !@user
            redirect_to signin_path
        end
    end

    def edit
        
        @user = User.find_by(id: session[:user_id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :cvo, :email, :password, :dob, :name, :admin, :uid, :image)
    end
end
