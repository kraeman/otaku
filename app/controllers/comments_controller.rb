class CommentsController < ApplicationController
    
    
    def create
        
       comment = Comment.create(content: comment_params[:content], show_id: comment_params[:show_id], user_id: session[:user_id])
    #    byebug
       redirect_to show_path(Show.find(comment.show_id))
    end

    def destroy
      comment = Comment.find(params[:id])
      show_id = comment.show_id
      if comment.user_id == session[:user_id]
        if comment.destroy
            redirect_to show_path(show_id)
        else
            redirect_to back
        end
    else
        redirect_to user_path(session[:user_id])
    end
  end    

    def comment_params
        params.require(:comment).permit(:content, :show_id)
    end
end
