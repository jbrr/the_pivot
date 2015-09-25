class AddColumnToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :featured, :boolean, :default => false
  end
end
