class AddProjectStoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_story, :text
  end
end
