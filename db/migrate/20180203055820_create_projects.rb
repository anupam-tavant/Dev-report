class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :pid
      t.text :description
      t.integer :default_branch_id
      t.boolean :is_public
      t.boolean :archived
      t.integer :visibility_level
      t.string :ssh_url_to_repo
      t.string :http_url_to_repo
      t.string :web_url
      t.string :name
      t.integer :creator_id
      # t.string :name_with_namespace
      # t.string :path
      # t.string :path_with_namespace
      # t.boolean :issues_enabled
      # t.boolean :merge_requests_enabled
      # t.boolean :builds_enabled
      # t.boolean :shared_runners_enabled
      # t.boolean :lfs_enabled
      # t.integer :star_count
      # t.integer :forks_count
      # t.integer :open_issues_count
      # t.boolean :public_builds
      # t.boolean :only_allow_merge_if_build_succeeds
      # t.boolean :request_access_enabled
      # t.boolean :only_allow_merge_if_all_discussions_are_resolved
      t.datetime :project_created_at
      t.datetime :project_last_activity_at
      t.text :permissions

      t.timestamps
    end
  end
end
