class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :commercial_name
      t.string :klass
      t.string :category
      t.decimal :concentration
      t.text :adverse
      t.integer :route_of_admin_value
      t.string :pronunciation

      t.timestamps
    end
  end
end
