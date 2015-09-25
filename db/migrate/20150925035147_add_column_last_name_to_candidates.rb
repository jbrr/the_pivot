class AddColumnLastNameToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :last_name, :string
  end
end
