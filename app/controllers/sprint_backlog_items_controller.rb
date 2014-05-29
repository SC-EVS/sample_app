class SprintBacklogItemsController < ApplicationController
  before_action :signed_in_user
  def new
    @back_log_items = Project.find(params[:project]).backlog_items
    @sprintbacklogitem = SprintBacklogItem.new
    @project = Project.find(params[:project])
  end

  def edit
    @sprintbacklogitem=SprintBacklogItem.find(params[:id])
  end

  def create
    @sprintbacklogitem = SprintBacklogItem.new(project_params)
    #@sprintbacklogitem.user = current_user


    if @sprintbacklogitem.save
      redirect_to @sprintbacklogitem.backlog_item.project
      flash[:success]="Subtask added succesfully"
    else
      render :new
    end
  end

  def update
    @sprintbacklogitem = SprintBacklogItem.find(params[:id])
    if @sprintbacklogitem.update_attributes(project_params)
      flash[:success] = "Subtask updated"
      redirect_to @sprintbacklogitem.backlog_item.project
    else
      render 'edit'
    end
  end

  def destroy
    SprintBacklogItem.find(params[:id]).destroy
    flash[:success] = "Sprint backlog item deleted."
    redirect_to :back
  end


  private

  def project_params
    params.require(:sprint_backlog_item).permit(:backlog_item_id, :user_id, :activity, :state, :subtask_description)#, :project_story)
  end



  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
