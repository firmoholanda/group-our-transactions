class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects.joins(:projects_groups).distinct
  end

  def index_projects_no_group
    @projects = current_user.projects.includes(:projects_groups).where(projects_groups: { group_id: nil })
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.groups << Group.find(params[:project][:group_ids]) if params[:project][:group_ids]    

    if @project.save
      flash.now[:info] = 'project created'
      if params[:project][:group_ids]
        redirect_to projects_path
      else
        redirect_to projects_no_group_path
      end
    else
      flash.now[:danger] = 'project creation failed.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @project.groups << Group.find(params[:project][:group_ids]) if params[:project][:group_ids]

    if @project.update(project_params)
      flash[:info] = 'project updated!'
      if params[:project][:group_ids]
        redirect_to projects_path
      else
        redirect_to second_index_path
      end
    else
      flash.now[:danger] = 'project update failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    @project.destroy
    flash.now[:info] = 'project deleted'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :hours, :author_id, group_ids: [], task_ids: [])
  end
end