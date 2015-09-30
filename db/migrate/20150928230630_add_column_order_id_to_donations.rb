class AddColumnOrderIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :order_id, :integer
  end
end
