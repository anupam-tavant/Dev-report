class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :pid
      t.text :description
      t.integer :default_branch_id
      t.boolean :is_public
      t.boolean :archived
      t.integer :visibility_level
      t.string :ssh_url
      t.string :http_url
      t.string :web_url
      t.string :name
      t.integer :creator_id
      t.datetime :project_created_at
      t.datetime :project_last_activity_at
      t.text :permissions
      t.timestamps
    end
  end
end
