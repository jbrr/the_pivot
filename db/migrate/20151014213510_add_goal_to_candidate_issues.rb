class AddGoalToCandidateIssues < ActiveRecord::Migration
  def change
    add_column :candidate_issues, :goal, :integer, default: 0
  end
end
