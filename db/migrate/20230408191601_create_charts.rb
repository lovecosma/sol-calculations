class CreateCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :charts do |t|
      t.belongs_to :owner, foreign_key: true
      t.timestamps
    end
  end
end
