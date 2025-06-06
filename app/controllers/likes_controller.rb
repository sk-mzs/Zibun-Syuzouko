class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_to posts_path, success: t('.success')
  end

  def destroy
    post = current_user.like_posts.find(params[:id])
    current_user.unlike(post)
    redirect_to posts_path, success: t('.success'), status: :see_other
  end
end
