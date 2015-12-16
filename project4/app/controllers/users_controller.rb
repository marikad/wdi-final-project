class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
