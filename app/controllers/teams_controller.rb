class TeamsController < ApplicationController
  before_action :signed_in_user
  def new
    @team = Team.new
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Member deleted."
    redirect_to :back
  end

 def create
   @team = Team.new(project_params)
   @user =User.find_by_email(project_params[:user_id])
   @project = Project.find_by_project_url(project_params[:project_id].strip)
 # Если нашелся пользователь и проект, и текущий пользователь -- создатель проекта
   if !@user.nil?&&!@project.nil?&&current_user.email==@project.user_email
     @team.user_id=@user.id
     @team.project_id=@project.id
     if @team.save
       flash[:success] = "Member was succesfully added"
       redirect_to current_user
     end
   else
     flash[:failure] = "Something went wrong. Check out wether project URL or user email is correct"
     render 'new'
   end

 end


private

def project_params
  params.require(:team).permit(:project_id, :user_id)
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