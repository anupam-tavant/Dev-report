class GitlabStat < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :branch
end
