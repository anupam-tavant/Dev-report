module Gitlab
  def fetch_groups
    groups = GitlabClient.new.collect_groups
    groups.each do |group|
      fetch_group_users(group["id"])
      fetch_project(group["id"])
    end
  end
  def fetch_project(group_id)
    projects = GitlabClient.new.collect_projects(group_id)
    ProjectCollection.create_or_update_project(projects)
  end

  def fetch_branches(project_response)
    project_pid = project_response.pid
    branches = GitlabClient.new.collect_branches(project_pid)
    Branch.create_or_update_branch(branches, project_response.id)
  end

  def fetch_project_users(project_response)
    project_pid = project_response.pid
    user_details = GitlabClient.new.collect_project_users(project_pid)
    User.create_or_update_user(user_details, project_id: project_response.id)
  end

  def fetch_group_users(group_id)
    user_details = GitlabClient.new.collect_group_users(group_id)
    User.create_or_update_user(user_details)
  end

  def fetch_commits(branch)
    branch_commits = GitlabClient.new.collect_commits(branch.project.pid, branch.name)
    GitlabStat.update_stat(branch, branch_commits)
  end

  module_function :fetch_project, :fetch_branches, :fetch_project_users, :fetch_group_users, :fetch_commits, :fetch_groups
end
