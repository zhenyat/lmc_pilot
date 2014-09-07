class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string  :name,  null: false
      t.string  :title, null: false

      t.timestamps
    end
    add_index :roles, :name, unique: true

    Role.create name: 'admin',    title: 'Администратор'
    Role.create name: 'employee', title: 'Сотрудник'
    Role.create name: 'guest',    title: 'Гость'
    Role.create name: 'hr',       title: 'Сотрудник RH'
  end
end
