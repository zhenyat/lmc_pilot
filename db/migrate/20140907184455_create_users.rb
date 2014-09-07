class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :role_id,         null: false
      t.string  :login,           null: false
      t.string  :password_digest, null: false
      t.string  :remember_token

      t.timestamps
    end
    add_index :users, :login, unique: true

    role_id  = Role.find_by(name: 'admin').id
    User.create role_id: role_id, login: 'lt',    password: 'Rada-2007', password_confirmation: 'Rada-2007'
    User.create role_id: role_id, login: 'zt',    password: 'Rada-2007', password_confirmation: 'Rada-2007'
    User.create role_id: role_id, login: 'ap',    password: 'Test-2014', password_confirmation: 'Test-2014'
    User.create role_id: role_id, login: 'cb',    password: 'Test-2014', password_confirmation: 'Test-2014'

    role_id  = Role.find_by(name: 'guest').id
    User.create role_id: role_id, login: 'guest', password: 'Demo-2014', password_confirmation: 'Demo-2014'
  end
end
