class TasksController < ApplicationController

  before_action :fetch_task, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @grouped_tasks = @project.tasks.decorate.group_by(&:status)
    @statuses = Status.order(:id).all
  end

  def show
    @project = @task.project
    @comment = Comment.new
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new(project_id: params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = current_user.authored_tasks.new(task_params)
    @task.project = @project
    @task.status = Status.find_by_name("ToDo")
    if @task.save
      redirect_to project_tasks_path(@project), notice: "Task created #{@task.name}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  def edit
    @users = User.all.decorate
    @statuses = Status.all
    @project = @task.project
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@task.project, @task)
    else
      render 'edit'
    end
  end

  def destroy
    @user = @task.author
    if @task.destroy
      redirect_to user_path(@user), success: "Task has been deleted."
    else
      redirect_to user_path(@user), alert: "Task has not been deleted."
    end
  end

  def update_tasks
    payload = JSON.parse(request.body.read)
    payload.each do |status_id, task_ids|
      task_ids.each do |task_id|
        task = Task.find(task_id)
        task.status_id = status_id
        task.save
      end
    end
    render text: 'OK'
  end


  private

  def fetch_task
    @task = Task.find(params[:id]).decorate
  end

  def task_params
    params.require(:task).permit(:name, :markdown_desc, :author_id, :owner_id, :status_id)
  end
end
