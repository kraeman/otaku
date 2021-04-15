class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by_email(params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          @user = nil
          render :new
        end
    end
    
    def destroy
        session.clear
        redirect_to "/login"
    end

    def omniauth
      @user = User.find_or_create_by(uid: auth["uid"]) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.username =  auth['info']['email']
          u.password = SecureRandom.hex(20)
          u.image = auth['info']['image']
          u.cvo = true
      end
      
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    def destroy
      session.clear
      redirect_to "/login"
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end

   

    
end
