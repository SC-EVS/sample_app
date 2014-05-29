class SprintTeamsController < ApplicationController
  before_action :signed_in_user
  def new
    @sprint_team = SprintTeam.new
    @project = Project.find(params[:project])
  end

  def create
    @sprint_team = SprintTeam.new(project_params)


    if @sprint_team.save
      flash[:success]="Sprint was succesfully added to project"
      redirect_to BacklogItem.find(project_params[:backlog_item_id]).project
    else
      render :new
    end
  end


  def destroy
    SprintTeam.find(params[:id]).destroy
    flash[:success] = "Sprint team deleted."
    redirect_to :back
  end

  private

  def project_params
    params.require(:sprint_team).permit(:backlog_item_id, :sprint_id)
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
