  class AddColumnFeaturedToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :featured, :boolean, :default => false
  end
end
