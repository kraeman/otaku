class CommentsController < ApplicationController
    
    
    def create
        
       comment = Comment.create(content: params[:comment][:content], show_id: params[:comment][:show_id], user_id: session[:user_id])
    #    byebug
       redirect_to show_path(Show.find(comment.show_id))
    end
end
