class ProjectsController < ApplicationController

  before_action :fetch_projects, only: [:show, :edit, :update]

  def index
    @projects = Project.all.decorate
    @activities = PublicActivity::Activity.all.order(created_at: :desc)
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
    ids = ProjectUser.where(project_id: @project.id).map {|pu| pu.user_id }
    ids.push @project.author.id
    @users = User.where.not(id: ids).decorate
  end

  def edit
  end

  def update
    if Project.find(params[:id]).author != current_user
      flash[:error] = 'You are not allowed to edit this project.'
      redirect_to project_path(params[:id])
    else
      if @project.update(project_params)
        flash[:notice] = "Project has been updated."
        redirect_to project_path(@project)
      else
        flash[:alert] = "Project has not been updated."
        redirect_to project_path(@project)
      end
    end
  end

  private
  def fetch_projects
    @project = Project.find(params[:id]).decorate
  end

  def project_params
    params.require(:project).permit(:title, :desc)
  end
end
