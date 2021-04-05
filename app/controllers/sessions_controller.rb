class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user
        else
          #set error message with flash
          redirect_to '/login', error: "Invalid credentials"
        end
    end
    
    def destroy
        session.clear
        redirect_to "/login"
    end

    def omniauth
      # byebug
      @user = User.find_or_create_by(uid: auth["uid"], name: auth['info']['name'], email: auth['info']['email'], username: auth['info']['email'], password_digest: SecureRandom.hex(20)) do |u|
        # u.name = auth['info']['name']
        # u.email = auth['info']['email']
        u.password = SecureRandom.hex(20)
        u.image = auth['info']['image']
        u.cvo = true
      end

      

      session[:user_id] = @user.id
      # byebug
      render 'users/show'
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end

    
end
