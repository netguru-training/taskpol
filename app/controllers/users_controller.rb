class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]).includes(:owned_tasks, :authored_tasks)
  end

end
