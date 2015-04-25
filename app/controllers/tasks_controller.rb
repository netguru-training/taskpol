class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = current_user.authored_tasks.new
  end

  def create
    @task = current_user.authored_tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task created #{@task.name}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :desc, :author_id, :owner_id, :status)
  end

end