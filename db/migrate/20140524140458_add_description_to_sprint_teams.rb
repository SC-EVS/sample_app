class AddDescriptionToSprintTeams < ActiveRecord::Migration
  def change
    add_column :sprint_backlog_items, :subtask_description, :text
  end
end
