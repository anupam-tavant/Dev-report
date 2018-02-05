module Gitlab
  def fetch_project
    projects = GitlabClient.new.collect_projects
    ProjectCollection.new.create_or_update_project(projects)
  end
  def fetch_branches(project_response)
    project_id = project_response.pid
    branches = GitlabClient.new.collect_branches(project_id)
    Branch.create_or_update_branch(branches, project_response.id)
  end
  def fetch_users(project_response)
    project_id = project_response.pid
    user_details = GitlabClient.new.collect_users(project_id)
    User.create_or_update_user(user_details,project_response.id)
  end

  module_function :fetch_project, :fetch_branches, :fetch_users
end
