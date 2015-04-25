class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @user = @task.author
    if @task.destroy
      redirect_to user_path(@user), success: "Task has been deleted."
    else
      redirect_to user_path(@user), alert: "Task has not been deleted."
    end
  end


  private

  def task_params
    params.require(:task).permit(:name, :desc, :author_id, :owner_id, :status)
  end

end
