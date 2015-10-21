class AddAuthCodeColumnstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :sent_code, :string
    add_column :users, :auth_code, :string, default: "9999999999999999LHDGJ<AEGLJHGV^68yu24jfbehkd"
  end
end
