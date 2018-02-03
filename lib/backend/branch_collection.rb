class BranchCollection
  def create_or_update_branch(branch_json, project_id)
    branch_json.each do |branch_detail|
      response = Branch.create_from_api(branch_detail, project_id)
    end
  end
end
