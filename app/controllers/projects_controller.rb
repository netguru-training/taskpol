class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(title: params[:project][:title], desc: params[:project][:desc], author_id: current_user.id)

    if @project.save
      redirect_to project_path(@project), notice: "Project has been created successfully."
    else
      redirect_to root_path, alert: "Project has not been created."
    end
  end

  def show
    @project = Project.find(params[:id]).decorate
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project), success: "Project has been updated."
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :desc)
  end
end
