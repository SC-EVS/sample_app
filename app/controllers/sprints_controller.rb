class SprintsController < ApplicationController
  before_action :signed_in_user
  def new
    @sprint=Sprint.new
    @project = Project.find(params[:project])
  end

  def destroy
    Sprint.find(params[:id]).destroy
    flash[:success] = "Sprint deleted."
    redirect_to :back
  end

  def create
    @sprint = Sprint.new(project_params)


    if @sprint.save
      redirect_to Project.find(project_params[:project_id])
    else
      render :new
    end
  end

  def edit
    #@user = User.find(params[:id])
    @sprint = Sprint.find(params[:id])
  end

  def update
    @sprint = Sprint.find(params[:id])
    if @sprint.update_attributes(project_params)
      flash[:success] = "Sprint updated"
      redirect_to @sprint.project
    else
      render 'edit'
    end
  end

  private

  def project_params
    params.require(:sprint).permit(:project_id, :title, :datestart, :dateend)
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
