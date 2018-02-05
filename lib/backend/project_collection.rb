class ProjectCollection
  def create_or_update_github_project project_json
    project_json.each do |project_detail|
      project = Project.create_from_api(project_detail)
      Gitlab.fetch_branches_for(project) if project
    end
  end
end