class ChangePhoneNumberInUsers < ActiveRecord::Migration
  def change
    change_column :users, :phone_number, :string
  end
end
