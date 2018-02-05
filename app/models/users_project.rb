class UsersProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.set_user_project(user_id, project_id, gitlab_enabled: false)
    user_project = find_or_initialize_by(user_id: user_id, project_id: project_id, gitlab_enabled: gitlab_enabled)
    if !user_project.id
      create(user_id: user_id, project_id: project_id, gitlab_enabled: gitlab_enabled)
    end
  end
end
