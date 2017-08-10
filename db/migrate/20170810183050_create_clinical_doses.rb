class CreateClinicalDoses < ActiveRecord::Migration[5.1]
  def change
    create_table :clinical_doses do |t|
      t.integer :min
      t.integer :max
      t.belongs_to :drug, foreign_key: true

      t.timestamps
    end
  end
end
