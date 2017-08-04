class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :name
      t.integer :category_id
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
