class CommentsController < ApplicationController
    
    
    def create
        
       comment = Comment.create(comment_params)
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

    def comment_params
        params.require(:comment).permit(:content, :show_id, :user_id)
    end
end
