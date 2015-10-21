class AddAuthCodeColumnstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :sent_code, :string
    add_column :users, :auth_code, :string, default: ""
  end
end
