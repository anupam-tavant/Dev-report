class JiraClient
  require 'rest_client'

  def initialize
  end

  def collect_projects
    url_for_project = prepare_url("project")
    call_api(url_for_project)
  end

  def collect_project_details
    url_for_project_details = prepare_url("project/#{id}")
    call_api(url_for_project_details)
  end

  private

  def prepare_url(uri)
    ENV["JIRA_BASE_URL"]+uri
  end

  def call_api(url)
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: {'Content-Type': 'application/json;charset=UTF-8',
                'Authorization': ENV["jira_private_token"]}
      )
    JSON.parse(response)
  end
end
