class UsersController < ApplicationController
    
    def new
        @user = User.new
        # byebug
        render :layout => false
    end
    
    def create
        # byebug
      
        @user = User.create(user_params)
        # byebug
        if @user.id
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            # byebug
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
        #if cvo is true, cant resent password
        @user = User.find_by(id: session[:user_id])
    end

    def update
        # byebug
        user = User.find_by_id(params[:id])
        user.update(user_params)
        if user.valid?
            redirect_to user
        else
            render :edit
        end
    end

    def destroy
    end
    
    private
    
    def user_params
        
        params.require(:user).permit(:username, :cvo, :email, :password, :dob, :name, :admin, :uid, :image)
    end
end
