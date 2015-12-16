class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  	@user = User.find(params[:id])
  end

end