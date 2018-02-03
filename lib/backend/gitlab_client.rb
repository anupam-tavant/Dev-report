class GitlabClient
  require 'rest_client'
  GITLAB_BASE_URL = 'https://gitlab.tavant.com/api/v3/'

  def initialize
  end

  def collect_projects
    url_for_project = prepare_url("projects")
    call_api(url_for_project)
  end

  def collect_branches(project_id)
    url_for_branches = prepare_url("projects/#{project_id}/repository/branches")
    call_api(url_for_branches)
  end

  private

  def prepare_url(uri)
    GITLAB_BASE_URL+uri
  end

  def call_api(url)
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: {private_token: 'SqgqXrMrrdt25-sw68Yz'}
      )
    JSON.parse(response)
  end
end
