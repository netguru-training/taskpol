class UsersController < ApplicationController
  def index
    @users = User.all.decorate
  end

  def show
    @user = User.find(params[:id]).decorate #.includes(:owned_tasks, :authored_tasks)
    @authored_tasks = Task.where(author_id: @user.id).all
    @owned_tasks = Task.where(owner_id: @user.id).all
    @created_projects = Project.where(author_id: @user.id)
  end

end
