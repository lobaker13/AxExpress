class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.integer :sex
      t.decimal :weight
      t.belongs_to :breed, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
