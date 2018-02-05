class GitlabClient
  require 'rest_client'
  GITLAB_BASE_URL = 'https://gitlab.tavant.com/api/v3/'

  def initialize
  end

  def collect_projects
    url_for_project = prepare_url("projects")
    call_api(url_for_project, header: api_header({simple: false}))
  end

  def collect_branches(project_id)
    url_for_branches = prepare_url("projects/#{project_id}/repository/branches")
    call_api(url_for_branches)
  end

  def collect_users(project_id)
    url_for_users = prepare_url("projects/#{project_id}/users")
    call_api(url_for_users)
  end

  private

  def prepare_url(uri)
    GITLAB_BASE_URL+uri
  end

  def call_api(url, header: api_header({}))
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: header
      )
    JSON.parse(response)
  end
  def api_header(header_string)
    header = Hash.new
    header[:private_token] = 'SqgqXrMrrdt25-sw68Yz'
    header.merge(header_string)
    header
  end
end
