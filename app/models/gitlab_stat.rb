class GitlabStat < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :branch

  def self.update_stat(branch, commits_json)
    commits_json.group_by{|commit| commit["committer_email"]}.each do |user_email, commits|
      if commits.count > 0
        user = User.find_by(email: user_email)
        create(user_id: user.id, project_id: branch.project.id, branch_id: branch.id,on_date: commits[0]["created_at"].to_datetime,no_of_commits: commits.count) if user
      end
    end
  end
end
