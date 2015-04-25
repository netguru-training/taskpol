class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(title: params[:title], desc: params[:desc], user_id: current_user.id)

    if @project.save
      redirect_to project_path(@project), notice: "Project has been created successfully."
    else
      redirect_to root_path, alert: "Project has not been created."
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:title, :desc)
  end
end
