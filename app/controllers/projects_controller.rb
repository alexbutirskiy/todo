class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def new
    @new_prj = Project.create(name: "New Project", user_id:  current_user.id)

    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js {}
    end
  end

  # TODO: Check user and id and render error page if needed
  def update
    @project = Project.find(params[:id])
    @project.update(name: (params[:project][:name]))
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    Project.delete(params[:id])
    @id = params[:id]
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js {}
    end
  end

end
