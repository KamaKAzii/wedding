class PostsController < ApplicationController
  
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.date = Time.now
    @post.user = @user
    if @post.save
      flash.notice = "Successfully added post"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  private

  def post_params
    params
      .require(:post)
      .permit(
        :title,
        :body)
  end

end
