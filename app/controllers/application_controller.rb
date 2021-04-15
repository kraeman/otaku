class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to signin_path if !logged_in?
    end

    def redirect_if_record_not_exist(record)
        if record
            redirect_if_not_logged_in
        else
            redirect_to root_path
        end
    end
    def redirect_if_logged_in
        redirect_to root_path if logged_in?
      end
end
