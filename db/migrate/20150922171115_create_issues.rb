class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :topic
      t.string :description

      t.timestamps null: false
    end
  end
end
