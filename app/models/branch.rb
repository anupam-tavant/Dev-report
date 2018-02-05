class Branch < ApplicationRecord
  belongs_to :project
  has_many :gitlab_stats, dependent: :nullify

  def self.create_or_update_branch(branch_json, project_id)
    branch_json.each do |branch_detail|
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
      else
        branch.update_attributes(last_commit: branch_detail["commit"])
      end
    end    
  end
end
