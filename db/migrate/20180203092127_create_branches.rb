class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.boolean :is_merged
      t.boolean :is_protected
      t.boolean :developers_can_push
      t.boolean :developers_can_merge
      t.integer :project_id
      t.string :last_commit

      t.timestamps
    end
  end
end
