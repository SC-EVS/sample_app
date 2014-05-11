class CreateBacklogItems < ActiveRecord::Migration
  def change
    create_table :backlog_items do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :item_type
      t.string :item_title
      t.string :item_state
      t.text :item_description
      t.date :item_deadline

      t.timestamps
    end
  end
end
