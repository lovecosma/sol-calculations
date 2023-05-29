class AddPersonalChartIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :personal_chart_id, :integer
  end
end
