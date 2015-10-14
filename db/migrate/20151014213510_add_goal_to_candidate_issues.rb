class AddGoalToCandidateIssues < ActiveRecord::Migration
  def change
    add_column :candidate_issues, :goal, :integer
  end
end
