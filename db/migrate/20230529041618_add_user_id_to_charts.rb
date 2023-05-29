class AddUserIdToCharts < ActiveRecord::Migration[7.0]
  def change
    add_column :charts, :user_id, :bigint
    add_foreign_key :charts, :users
  end
end