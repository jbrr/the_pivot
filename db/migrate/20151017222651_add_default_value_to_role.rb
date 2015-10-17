class AddDefaultValueToRole < ActiveRecord::Migration
  def change
    change_column :roles, :name, :string, :default => "registered_user"
  end
end
