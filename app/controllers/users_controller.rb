class UsersController < ApplicationController
  def index
    @users = User.where(deleted_at: nil).decorate
  end

  def show
    @user = User.find(params[:id]).decorate
    @authored_tasks = Task.where(author_id: @user.id).all
    @owned_tasks = Task.where(owner_id: @user.id).all
  end

end
