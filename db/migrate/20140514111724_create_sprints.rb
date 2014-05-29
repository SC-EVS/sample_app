class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :project_id
      t.string :title
      t.date :datestart
      t.date :dateend

      t.timestamps
    end
  end
end
