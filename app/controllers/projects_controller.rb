class ProjectsController < ApplicationController

  def index
    @projects = Project.all.decorate
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
    ids = ProjectUser.where(project_id: @project.id).map {|pu| pu.user_id }
    ids.push @project.author.id
    @users = User.where.not(id: ids).decorate
  end

  def edit
    if Project.find(params[:id]).author != current_user
      flash[:error] = 'You are not allowed to edit this project.'
      redirect_to project_path(params[:id])
    end
    @project = Project.find(params[:id])
  end

  def update
    if Project.find(params[:id]).author != current_user
      flash[:error] = 'You are not allowed to update this project.'
      redirect_to project_path(params[:id])
    end

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
