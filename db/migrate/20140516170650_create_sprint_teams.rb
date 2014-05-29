class CreateSprintTeams < ActiveRecord::Migration
  def change
    create_table :sprint_teams do |t|
      t.integer :backlog_item_id
      t.integer :sprint_id

      t.timestamps
    end
  end
end
