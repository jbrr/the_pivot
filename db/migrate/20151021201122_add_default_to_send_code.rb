class AddDefaultToSendCode < ActiveRecord::Migration
  def change
    change_column :users, :sent_code, :string, default: "1111"
  end
end
