class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]
  
  def index
  	@users = User.where(role: "actor")
  end

  def show
  	@user = User.find(params[:id])
  end

end