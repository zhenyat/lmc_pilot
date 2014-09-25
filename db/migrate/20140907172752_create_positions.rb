################################################################################
# 24.09.2014  Last update
################################################################################
class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string  :name,  null: false
      t.string  :title, null: false

      t.timestamps
    end
    add_index :positions, :name

    Position.create name: 'seller',         title: 'Продавец-консультант'
    Position.create name: 'senior_seller',  title: 'Менеджер отдела'
    Position.create name: 'sector_head',    title: 'Руководитель сектора'
    Position.create name: 'store_director', title: 'Директор магазина'
    Position.create name: 'admin',          title: 'Администратор системы'
    Position.create name: 'hr',             title: 'Руководитель службы персонала'
  end
end
