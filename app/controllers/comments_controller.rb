class CommentsController < ApplicationController

  before_action :fetch_comment, only: [:index, :show, :edit, :update, :destroy]

  def index
    #@comments = Comment.all.decorate
    @comment = @task.comment
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = task.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to :back, notice: "Comment created #{@comment.desc}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  private

  def fetch_comment
    @comment = Comment.find(params[:id]).decorate
  end

  def task
    Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit( :desc )
  end
end