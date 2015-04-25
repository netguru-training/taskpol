class ProjectUsersController < ApplicationController
  def destroy
    p = ProjectUser.where(project_id: params[:project_id], user_id: params[:user_id])
    if p.destroy_all
      flash[:notice] = "Successfully deleted user from project."
      redirect_to project_path(id: params[:project_id])
    else
      flash[:error] = "Error occurred."
      redirect_to project_path(id: params[:project_id])
    end
  end

  def create
    p = ProjectUser.new
    p.project_id = params[:project_id]
    p.user_id = params[:user_id]
    if p.save
      flash[:notice] = "Successfully added user to project."
      redirect_to project_path(id: params[:project_id])
    else
      flash[:error] = "Error occurred."
      redirect_to project_path(id: params[:project_id])
    end
  end
end
