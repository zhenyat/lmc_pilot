class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string  :name,   null: false
      t.string  :title,  null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :stores, :name, unique: true

    Store.create name: 'lefortovo', title: 'Лефортово',        active: true
    Store.create name: 'co',        title: 'Центральный офис', active: true
    Store.create name: 'khimki',    title: 'Химки'
  end
end
