class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :store_id,      null: false
      t.integer :department_id, null: false
      t.integer :position_id,   null: false
      t.integer :level_id,      null: false
      t.integer :manager_id
      t.string  :last_name,     null: false
      t.string  :first_name,    null: false
      t.string  :middle_name,   null: false
      t.string  :pin,           null: false
      t.boolean :active,        null: false, default: true

      t.timestamps
    end
    add_index :employees, :pin, unique: true
  end
end
