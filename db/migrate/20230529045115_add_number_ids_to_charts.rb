class AddNumberIdsToCharts < ActiveRecord::Migration[7.0]
  def change
    add_column :charts, :soul_urge_id, :integer
    add_column :charts, :personality_id, :integer
    add_column :charts, :life_path_id, :integer
    add_column :charts, :expression_id, :integer
    add_column :charts, :formative_id, :integer
    add_column :charts, :harvest_id, :integer
    add_column :charts, :productive_id, :integer
    add_column :charts, :first_minor_id, :integer
    add_column :charts, :second_minor_id, :integer
    add_column :charts, :major_id, :integer
    add_column :charts, :attainment_id, :integer
    add_column :charts, :foundation_id, :integer
    add_column :charts, :obligation_id, :integer
    add_column :charts, :retrospection_id, :integer
  end
end
