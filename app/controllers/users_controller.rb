class UsersController < ApplicationController
  def new
    @user = User.new
    @post = @user.posts.new
  end

  def create
    @user = User.new(params[:user])
    @user.posts.new(params[:user][:post_attributes])
    if @user.save
      login_user
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
