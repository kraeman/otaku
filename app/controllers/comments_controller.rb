class CommentsController < ApplicationController
    
    
    def create
        
       comment = Comment.create(content: params[:comment][:content], show_id: params[:comment][:show_id], user_id: session[:user_id])
    #    byebug
       redirect_to show_path(Show.find(comment.show_id))
    end

    def destroy
      comment = Comment.find(params[:id])
      show_id = comment.show_id
      if comment.destroy
          redirect_to show_path(show_id)
      else
          redirect_to back
      end
  end    
end
