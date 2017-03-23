class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :breed_id
      t.integer :gender
      t.boolean :castrated
      t.date :born_at
      t.string :client_name
      t.string :phone
      t.datetime :last_visit
      t.timestamps
    end
  end
end
