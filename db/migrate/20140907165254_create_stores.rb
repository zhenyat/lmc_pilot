class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string  :name,  null: false
      t.string  :title, null: false

      t.timestamps
    end
    add_index :stores, :name, unique: true

    Store.create name: 'lefortove', title: 'Лефортово'
    Store.create name: 'khimki',    title: 'Химки'
  end
end
