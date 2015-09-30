class AddColumnUserIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
  end
end
