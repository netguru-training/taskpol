class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def create
    #current_user.authored_tasks
    @task = current_user.task.new(task_params)
    if @task.save
      redirect_to tasks_path, success: "Task created #{@task.name}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :desc, :author_id, :owner_id, :status)
  end

end
