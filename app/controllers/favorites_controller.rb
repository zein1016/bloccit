class FavoritesController < ApplicationController

 def create 
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.build(post: @post)
  authorize favorite
   if favorite.save

    flash[:notice] = "You have favorited the post"
   redirect_to [@post.topic, @post]
   else
   flash[:error] = "There was an error in favoriting your post. Please try again"
   redirect_to :back
   end
 end

 def destroy 
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites(params[:user_id]).first
   authorize favorite
   if favorite.destroy

    flash[:notice] = "You have unfavorited the post"
   redirect_to [@post.topic, @post] 
   else
   flash[:error] = "There was an error in unfavoriting your post. Please try again"
   redirect_to :back
   end
 end

end
