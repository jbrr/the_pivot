class AddCandidateIdAndReasonToUserRoles < ActiveRecord::Migration
  def change
    add_reference :user_roles, :candidate, index: true, foreign_key: true
    add_column :user_roles, :reason, :string
  end
end
