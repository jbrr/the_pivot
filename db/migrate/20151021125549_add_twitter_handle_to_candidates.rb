class AddTwitterHandleToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :twitter_handle, :string
  end
end
