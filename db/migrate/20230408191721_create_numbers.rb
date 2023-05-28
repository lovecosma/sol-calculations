class CreateNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :numbers do |t|
      t.string :type, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
