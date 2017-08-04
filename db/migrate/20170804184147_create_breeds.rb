class CreateBreeds < ActiveRecord::Migration[5.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.integer :species
      t.integer :status

      t.timestamps
    end
  end
end
