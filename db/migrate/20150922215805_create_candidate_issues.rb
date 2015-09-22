class CreateCandidateIssues < ActiveRecord::Migration
  def change
    create_table :candidate_issues do |t|
      t.string :stance
      t.integer :candidate_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
