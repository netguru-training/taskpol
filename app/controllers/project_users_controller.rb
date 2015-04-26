class ProjectUsersController < ApplicationController
  def destroy
    if current_user == Project.find(params[:project_id]).author
      p = ProjectUser.where(project_id: params[:project_id], user_id: params[:user_id])
      if p.destroy_all

        tasks = Task.where(project_id: params[:project_id], owner_id: params[:user_id])
        tasks.each do |task|
          task.owner_id = nil
          task.save
        end

        flash[:notice] = "Successfully deleted user from project."
        redirect_to project_path(id: params[:project_id])
      else
        flash[:error] = "Error occurred."
        redirect_to project_path(id: params[:project_id])
      end
    else
      flash[:error] = "Only project creator can delete users from project."
      redirect_to project_path(id: params[:project_id])
    end
  end

  def create
    if current_user == Project.find(params[:project_id]).author
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
    else
      flash[:error] = "Only project creator can add users to project."
      redirect_to project_path(id: params[:project_id])
    end
  end
end
