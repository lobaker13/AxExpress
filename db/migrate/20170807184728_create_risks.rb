class CreateRisks < ActiveRecord::Migration[5.1]
  def change
    create_table :risks do |t|
      t.integer :asa
      t.string :temperament
      t.integer :bcs
      t.string :breed
      t.string :comorbidities
      t.integer :age
      t.integer :heart_murmur
      t.string :procedure
      t.boolean :history
      t.belongs_to :patient_procedure, foreign_key: true

      t.timestamps
    end
  end
end
