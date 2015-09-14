class TasksController < ApplicationController
  # TODO: check if project_id is valid
  def create
    task = Task.new
    task.name = params[:task][:name]
    task.project_id = params[:project_id]
    task.priority = task.project.tasks.count
    task.save!

    render_project(task.project_id)
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:task][:name] if params[:task][:name]
    task.status = params[:task][:status] if params[:task][:status]
    task.priority = params[:task][:order] if params[:task][:order]
    task.save! if task.project_id == params[:project_id].to_i
    prioritize(task) if params[:task][:order]

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

  def prioritize(task)
    prio = 0
    task.project.tasks.order(priority: :asc).each do |t|
      next if t.id == task.id || t.status == 'completed'
      prio += 1 if prio == task.priority
      t.priority = prio
      t.save!
      prio += 1
    end
  end
end
