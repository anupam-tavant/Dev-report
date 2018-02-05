class ProjectCollection
  def create_or_update_project project_json
    project_json.each do |project_detail|
      project = Project.create_from_api(project_detail)
      Gitlab.fetch_branches(project) if project
      Gitlab.fetch_users(project) if project
    end
  end
end
