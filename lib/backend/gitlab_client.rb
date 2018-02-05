class GitlabClient
  require 'rest_client'
  GITLAB_BASE_URL = 'https://gitlab.tavant.com/api/v3/'

  def initialize
  end

  def collect_groups
    groups_url = prepare_url("groups")
    call_api(groups_url)
  end

  def collect_projects(group_id)
    projects_url = prepare_url("groups/#{group_id}/projects")
    call_api(projects_url)
  end

  def collect_branches(project_id)
    branches_url = prepare_url("projects/#{project_id}/repository/branches")
    call_api(branches_url)
  end

  def collect_group_users(group_id)
    users_url = prepare_url("groups/#{group_id}/members")
    call_api(users_url)
  end

  def collect_project_users(project_id)
    users_url = prepare_url("projects/#{project_id}/users")
    call_api(users_url)
  end

  def collect_commits(project_id, branch_name)
    commits_url = prepare_url("projects/#{project_id}/repository/commits")
    call_api(commits_url, header: api_header(params: {ref_name: branch_name, since: Date.yesterday.beginning_of_day.strftime("%Y-%m-%dT%H:%M:%SZ"), until: Date.yesterday.end_of_day.strftime("%Y-%m-%dT%H:%M:%SZ")}))
  end

  private

  def prepare_url(uri)
    GITLAB_BASE_URL+uri
  end

  def call_api(url, header: api_header(params: {}))
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: header
      )
    JSON.parse(response)
  end
  def api_header(params: {})
    header = Hash.new
    header[:private_token] = 'SqgqXrMrrdt25-sw68Yz'
    header.merge!(params: params)
    header
  end
end
