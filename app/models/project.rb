class Project < ApplicationRecord
  has_many :users_projects
  has_many :users, through: :users_projects
  has_many :branches
  has_many :gitlab_stats, dependent: :destroy
  has_many :jira_stats, dependent: :destroy

  def self.create_from_api project_detail
    eng_project = find_by(name: project_detail["name"])
    if !eng_project
      eng_project = new(
        pid: project_detail["id"],
        description: project_detail["description"],
        is_public: project_detail["public"],
        archived: project_detail["archived"],
        visibility_level: project_detail["visibility_level"],
        ssh_url_to_repo: project_detail["ssh_url_to_repo"],
        http_url_to_repo: project_detail["http_url_to_repo"],
        web_url: project_detail["web_url"],
        name: project_detail["name"],
        name_with_namespace: project_detail["name_with_namespace"],
        path: project_detail["path"],
        path_with_namespace: project_detail["path_with_namespace"],
        issues_enabled: project_detail["issues_enabled"],
        merge_requests_enabled: project_detail["merge_requests_enabled"],
        builds_enabled: project_detail["builds_enabled"],
        shared_runners_enabled: project_detail["shared_runners_enabled"],
        lfs_enabled: project_detail["lfs_enabled"],
        creator_id: project_detail["creator_id"],
        star_count: project_detail["star_count"],
        forks_count: project_detail["forks_count"],
        open_issues_count: project_detail["open_issues_count"],
        public_builds: project_detail["public_builds"],
        only_allow_merge_if_build_succeeds: project_detail["only_allow_merge_if_build_succeeds"],
        request_access_enabled: project_detail["request_access_enabled"],
        only_allow_merge_if_all_discussions_are_resolved: project_detail["only_allow_merge_if_all_discussions_are_resolved"],
        permissions: project_detail["permissions"],
        project_created_at: project_detail["created_at"],
        project_last_activity_at: project_detail["last_activity_at"]
        )
      eng_project.save!
    end
    eng_project
  end
end
