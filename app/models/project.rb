class Project < ApplicationRecord
  has_many :users_projects
  has_many :users, through: :users_projects
  has_many :branches
  has_many :gitlab_stats, dependent: :destroy
  has_many :jira_stats, dependent: :destroy

  def self.create_from_api project_detail
    project = find_by(name: project_detail["name"])
    if !project
      project = new(
        pid: project_detail["id"],
        description: project_detail["description"],
        is_public: project_detail["public"],
        archived: project_detail["archived"],
        visibility_level: project_detail["visibility_level"],
        ssh_url: project_detail["ssh_url_to_repo"],
        http_url: project_detail["http_url_to_repo"],
        web_url: project_detail["web_url"],
        name: project_detail["name"],
        creator_id: project_detail["creator_id"],
        permissions: project_detail["permissions"],
        project_created_at: project_detail["created_at"],
        project_last_activity_at: project_detail["last_activity_at"]
        )
      project.save!
    else
      project.update_attributes(project_last_activity_at: project_detail["last_activity_at"])
    end
    project
  end
end
