class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_url
      t.string :user_email

      t.timestamps
    end
  end
end
