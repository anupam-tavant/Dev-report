class Branch < ApplicationRecord
  belongs_to :project

  def self.create_from_api(branch_detail, project_id)
    branch = find_by(name: branch_detail["name"], project_id: project_id)
    if !branch
      branch = new(
        name: branch_detail["name"],
        is_merged: branch_detail["merged"],
        is_protected: branch_detail["protected"],
        developers_can_push: branch_detail["developers_can_push"],
        developers_can_merge: branch_detail["developers_can_merge"],
        project_id: project_id,
        last_commit: branch_detail["commit"]
        )
      branch.save!
    end
  end
end
