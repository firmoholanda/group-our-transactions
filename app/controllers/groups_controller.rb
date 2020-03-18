class GroupsController < ApplicationController
    before_action :set_group, only: %i[show edit update destroy]

  def new
    @group = Group.new
  end

  def index
    @groups = Group.all.order(name: :asc)
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      flash.now[:info] = 'group created'
      redirect_to groups_path
    else
      flash.now[:danger] = 'group creation failed!'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @group.update(group_params)
      flash[:info] = 'group updated.'
      redirect_to groups_path
    else
      flash.now[:danger] = 'group update failed!'
      redirect_to 'edit'
    end
  end

  def destroy
    @group.destroy
    flash.now[:info] = 'group deleted.'
    redirect_to groups_path
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :user_id, :icon)
    end
end
