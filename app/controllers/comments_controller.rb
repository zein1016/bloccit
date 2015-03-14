class CommentsController < ApplicationController
  def create
   
   @post = Post.find(params[:post_id])
   @comment = @post.comments.new(comment_params)
   
   @comment.user_id = current_user.id
    if @comment.save 
      flash[:notice] = "Comment was saved"
      redirect_to topic_post_path
    else
      flash[:error] = "There was an error saving your comment. Please try again"
      redirect_to topic_post_path
    end

  end 

  def destroy 
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to topic_post_path
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to topic_post_path
     end
   end
    
 private

  def comment_params
     params.require(:comment).permit(:body)
  end

end