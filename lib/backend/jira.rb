module Jira
  def fetch_project
    projects = jira_client.collect_projects
    details = fetch_project_details(projects)
    ProjectCollection.new.create_or_update_jira_project(details)
  end
  def fetch_project_details(projects)
    details = Array.new
    projects.map do |project|
   		details << jira_client.collect_project_details(project['key'])
    end
    details
  end

  def jira_client
  	@jira_client ||= JiraClient.new
  end

  module_function :fetch_project

  private_class_method :jira_client

end
