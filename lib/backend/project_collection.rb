class ProjectCollection
  def self.create_or_update_project project_json
    project_json.each do |project_detail|
      project = Project.create_from_api(project_detail)
      if project
        Gitlab.fetch_project_users(project)
        Gitlab.fetch_branches(project)
      end
    end
  end
end
