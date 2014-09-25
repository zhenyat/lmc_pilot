class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :store,           null: false, index: true
      t.references :department,      null: false, index: true
      t.references :position,        null: false, index: true
      t.references :level,           null: false, index: true
      t.references :manager
      t.string     :login,           null: false
      t.string     :last_name,       null: false
      t.string     :first_name,      null: false
      t.string     :middle_name,                  default: ''
      t.boolean    :active,          null: false, default: true
      t.string     :password_digest, null: false
      t.string     :remember_token

      t.timestamps
    end
    add_index :users, :login, unique: true

    add_foreign_key :users, :stores
    add_foreign_key :users, :departments
    add_foreign_key :users, :positions
    add_foreign_key :users, :levels
  end
end
