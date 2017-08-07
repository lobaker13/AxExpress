class CreateProtocolDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :protocol_drugs do |t|
      t.decimal :dose
      t.integer :additional_analgesic
      t.belongs_to :drug, foreign_key: true
      t.belongs_to :protocol, foreign_key: true

      t.timestamps
    end
  end
end
