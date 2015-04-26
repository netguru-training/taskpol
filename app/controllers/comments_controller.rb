class CommentsController < ApplicationController

  before_action :fetch_comment, only: [:index, :show, :edit, :update, :destroy]

  def index
    @comments = Comment.all.decorate
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.authored_commments.new(comment_params)
    if @comment.save
      redirect_to :back, notice: "Comment created #{@comment.desc}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  private

  def fetch_comment
    @comment = Comment.find(params[:id]).decorate
    @comments = Comment.all.decorate
  end

  def comment_params
    params.require(:comment).permit( :desc, :author_id, :task_id )
  end
end