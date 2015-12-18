class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  	@user = User.find(params[:id])
  end

  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user
    redirect_to users_link
  end

  def downvote
    @user = User.find(params[:id])
    @user.downvote_by current_user
    redirect_to users_link
  end

end