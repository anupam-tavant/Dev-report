class CreateJiraStats < ActiveRecord::Migration[5.0]
  def change
    create_table :jira_stats do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.datetime :on_date
      t.integer  :no_of_resolved, default: 0, null: false
      t.integer  :no_of_accepted, default: 0, null: false
      t.integer  :no_of_rejected, default: 0, null: false
      t.integer  :no_of_reopened, default: 0, null: false
      t.timestamps
    end
  end
end
