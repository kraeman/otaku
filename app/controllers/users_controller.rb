class UsersController < ApplicationController
    
    def new
        render :layout => false
        @user = User.new
    end
    
    def create
        # byebug
        @user = User.create(user_params)
        if @user.id
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
    end
    
    def show
       
        @user = User.find_by(id: session[:user_id])
        if !@user
            redirect_to signin_path
        end
    end

    def edit
        #if cvo is true, cant resent password
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def user_params
        params.permit(:username, :cvo, :email, :password, :dob, :name, :admin, :uid, :image)
    end
end
