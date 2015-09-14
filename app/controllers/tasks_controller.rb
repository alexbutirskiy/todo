class TasksController < ApplicationController
  before_action :find_task, only: [:update, :destroy]

  # TODO: check if project_id is valid
  def create
    task = Task.new
    task.name = task_para[:name] # params[:task][:name]
    task.project_id = params[:project_id]
    task.priority = task.project.tasks.count
    task.save!

    render_project(task.project_id)
  end

  # TODO: Fix Rubocop wornings
  # Order is like a priority at present
  def update
    @task.name = task_para[:name] if task_para[:name]
    @task.status = task_para[:status] if task_para[:status]
    @task.priority = task_para[:order] if task_para[:order]
    @task.save! if project_valid?
    prioritize(@task) if task_para[:order]

    render_project @task.project_id
  end

  # TODO: check if task is valid
  def destroy
    @task.destroy! if project_valid?
    render_project @task.project_id
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_para
    {
      name: params[:task][:name],
      status: params[:task][:status],
      order: params[:task][:order]
    }
  end

  def project_valid?
    @task.project_id == params[:project_id].to_i
  end

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
