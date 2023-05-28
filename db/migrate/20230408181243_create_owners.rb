class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :first_name, null: false
      t.string :middle_name, default: ''
      t.string :last_name, null: false
      t.date :birthdate, null: false

      t.timestamps
    end
  end
end
