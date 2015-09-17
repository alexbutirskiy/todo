class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :destroy]

  # TODO: check if project_id is valid
  def create
    task = Task.new
    task.start_date = Time.now
    task.name = task_params[:name] # params[:task][:name]
    task.project_id = params[:project_id]
    task.priority = task.project.tasks.count
    task.save!

    render_project(task.project_id)
  end

  def show
    # byebug
    # puts
  end

  # TODO: Fix Rubocop wornings
  # Order is like a priority at present
  def update
    @task.name =        task_params[:name]        if task_params[:name]
    @task.status =      task_params[:status]      if task_params[:status]
    @task.priority =    task_params[:order]       if task_params[:order]
    @task.note =        task_params[:note]        if task_params[:note]
    @task.start_date =  task_params[:start_date]  if task_params[:start_date]
    @task.due_date =    task_params[:due_date]    if task_params[:due_date]
    @task.attachment =  task_params[:attachment]  if task_params[:attachment]
    @task.save! if project_valid?
    prioritize(@task) if task_params[:order]
byebug
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

  def task_params
    {
      name:       params[:task][:name],
      status:     params[:task][:status],
      order:      params[:task][:order],
      note:       params[:task][:note],
      start_date: params[:task][:start_date],
      due_date:   params[:task][:due_date],
      attachment: params[:task][:attachment]
    }
  end

  def project_valid?
    @task.project_id == params[:project_id].to_i
  end

  def render_project(id)
    @project = Project.find(id)
    respond_to do |format|
      #format.html { render 'projects/update' }
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
