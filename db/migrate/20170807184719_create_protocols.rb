class CreateProtocols < ActiveRecord::Migration[5.1]
  def change
    create_table :protocols do |t|
      t.decimal :weight
      t.integer :age
      t.integer :asa
      t.integer :bcs
      t.text :alert
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
