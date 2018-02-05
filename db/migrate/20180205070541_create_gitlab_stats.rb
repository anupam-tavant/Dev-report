class CreateGitlabStats < ActiveRecord::Migration[5.0]
  def change
    create_table :gitlab_stats do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.belongs_to :branch, index: true
      t.datetime :on_date
      t.integer  :no_of_commits, default: 0, null: false
      t.timestamps
    end
  end
end
