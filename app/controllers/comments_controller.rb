class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.new(comment_params)
    if @comment.save
      redirect_to comment_path, notice: "Comment created #{@comment.desc}."
    else
      render :new, error: "Something gone wrong. Please try again."
    end
  end

  private

  def comment_params
    params.require(:comment).permit( :desc, :author_id )
  end
end