class BacklogItemsController < ApplicationController
  def new
   @backlogitem = BacklogItem.new
  end

  def destroy
    BacklogItem.find(params[:id]).destroy
    flash[:success] = "Backlog item deleted."
    redirect_to :back
  end

  def create

    @backlogitem  = BacklogItem.new(project_params)
    @user =User.find_by_email(project_params[:user_id].strip)
    @project = Project.find_by_project_url(project_params[:project_id].strip)
    if !@user.nil?&&!@project.nil?
      @backlogitem.user_id=@user.id
      @backlogitem.project_id=@project.id
    end
    if !@user.nil?&&!@project.nil?&&@backlogitem.save
      flash[:success] = "Backlog item was succesfully created!"
      redirect_to @project
    else
      render 'new'
    end
  end


  def edit
     @backlogitem = BacklogItem.find(params[:id])
  end

  def update

    @backlogitem = BacklogItem.find(params[:id])
    @project = Project.find(@backlogitem.project_id)
    if @backlogitem.update_attributes(project_params)
      flash[:success] = "Backlog item updated"
      redirect_to @project
    else
      render 'edit'
    end
  end



  private

  def project_params
    params.require(:backlog_item).permit(:project_id, :user_id, :item_type, :item_title, :item_state,
    :item_description, :item_deadline)
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
