class CircleCirclesController < ApplicationController
  def new
    @circle_circle = CircleCircle.new
    @users = User.all
  end

  def create
    @circle_circle = CircleCircle.new(params[:circle])
    @circle_circle.friends << @current_user unless @circle_circle.friends.include?(current_user)
    if @circle_circle.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = "You messed up!"
      render :new
    end
  end

  def show
    @circle = CircleCircle.find(params[:id])

  end

  def edit
    @circle = CircleCircle.find(params[:id])
    @users = User.all

  end

  def update
    @circle = CircleCircle.find(params[:id])

    @circle.assign_attributes(params[:circle])
    @circle.friends << @current_user unless @circle.friends.include?(current_user)

    if @circle.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = "You messed up!"
      render :edit
    end

  end



end
