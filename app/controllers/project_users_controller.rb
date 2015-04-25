class ProjectUsersController < ApplicationController
  def destroy
    @project = ProjectUser.where(project_id: params[:project_id], user_id: params[:user_id])
    if @project.destroy_all
      flash[:notice] = "Successfully deleted user from project."
      redirect_to project_path(id: params[:project_id])
    else
      flash[:error] = "Error occurred."
      redirect_to project_path(id: params[:project_id])
    end
  end

  def create
    @project = ProjectUser.new(project_id: params[:project_id], user_id: params[:user_id])

    if @project.save
      flash[:notice] = "Successfully added user to project."
      redirect_to project_path(id: params[:project_id])
    else
      flash[:error] = "Error occurred."
      redirect_to project_path(id: params[:project_id])
    end
  end
end
