class CreateSprintBacklogItems < ActiveRecord::Migration
  def change
    create_table :sprint_backlog_items do |t|
      t.integer :backlog_item_id
      t.integer :user_id
      t.string :activity
      t.string :state

      t.timestamps
    end
  end
end
