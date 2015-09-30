class AddDefaulForStatusToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string, default: "completed"
  end
end
