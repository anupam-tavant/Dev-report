module Gitlab
  def fetch_project
    projects = GitlabClient.new.collect_projects
    ProjectCollection.new.create_or_update_project(projects)
  end
  def fetch_branches_for(project_response)
    project_id = project_response.pid
    branches = GitlabClient.new.collect_branches(project_id)
    BranchCollection.new.create_or_update_branch(branches, project_response.id)
  end

  module_function :fetch_project, :fetch_branches_for
end
