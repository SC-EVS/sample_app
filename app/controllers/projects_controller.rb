class ProjectsController < ApplicationController
  before_action :signed_in_user #, only: [:index, :edit, :update, :create]
  def show
    @project = Project.find(params[:id])
    if !params[:user].nil?
      @user = User.find(params[:user])
    end
    if !params[:backlog_item].nil?
      @backlog_item = BacklogItem.find(params[:backlog_item])
    end

    if !params[:sprint_backlog_item].nil?
      @sprint_backlog_item = SprintBacklogItem.find(params[:sprint_backlog_item])
    end
    if !params[:user_name].nil?
      @user_selected = User.find(params[:user_name])
    end
lolka = 0
  end

  def new
    @project = Project.new
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to current_user
  end

  def index
  end

  def create
    @project = Project.new(project_params)
    @user =current_user
    if !@user.nil?
      @project.user_id=@user.id
      @project.user_email=@user.email
    end
    if !@user.nil?&&@project.save
      flash[:success] = "Project was succesfully created!"
      redirect_back_or current_user
    else
      render 'new'
    end
  end


  def edit
    #@user = User.find(params[:id])
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_url, :user_email, :project_story)
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
