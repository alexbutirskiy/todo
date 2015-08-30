class TasksController < ApplicationController
  # TODO: check if project_id is valid
  def create
    task = Task.new
    task.name = params[:task][:name]
    task.project_id = params[:project_id]
    task.save!

    render_project(task.project_id)
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:task][:name] if params[:task][:name]
    task.status = params[:task][:status] if params[:task][:status]
    task.save! if task.project_id == params[:project_id].to_i
    render_project task.project_id
  end

  # TODO: check if task is valid
  def destroy
    task = Task.find(params[:id])
    task.destroy! if task.project_id == params[:project_id].to_i
    render_project task.project_id
  end

  private

  def render_project(id)
    @project = Project.find(id)
    respond_to do |format|
      format.js { render 'projects/update' }
    end
  end

end
