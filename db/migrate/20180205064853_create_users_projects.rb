class CreateUsersProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :users_projects do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.boolean :gitlab_enabled, default: false
      t.boolean :jira_enabled, default: false
      t.timestamps
    end
  end
end
