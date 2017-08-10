class CreateClinicalDoses < ActiveRecord::Migration[5.1]
  def change
    create_table :clinical_doses do |t|
      t.decimal :min
      t.decimal :max
      t.belongs_to :drug, foreign_key: true
      t.integer :species_id

      t.timestamps
    end
  end
end
