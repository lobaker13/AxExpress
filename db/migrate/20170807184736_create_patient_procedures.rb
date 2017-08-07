class CreatePatientProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_procedures do |t|
      t.belongs_to :procedure, foreign_key: true
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
