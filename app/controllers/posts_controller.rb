class PostsController < ApplicationController
  def new
    @post = Post.new
    @circles = current_user.circle_circles
  end

  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
      redirect_to @post
    else
      flash[:errors] ||= []
      flash[:errors] << "Post didn't save"
      render :new
    end
  end

  def index
    @circles = current_user.circle_circles.includes(:posts)
    @feed = @circles.map {|circle| circle.posts}
  end

  def show
    render :json => Post.find(params[:id])
  end

  def destroy
  end
end
