class CommentsController < ApplicationController
  def create
    Comment.create!(comment_params)
    render_comments
  end

  def destroy
    Comment.destroy params[:id]
    render_comments
  end

  private

  def comment_params
    c = params.require(:comment).permit(:txt, :attachment)
    t = params.permit(:task_id)
    c.merge t
  end

  def render_comments
    @task = Task.find(params[:task_id])
    @comment = Comment.new

    respond_to do |format|
      format.js { render 'tasks/show' }
    end
  end

end
