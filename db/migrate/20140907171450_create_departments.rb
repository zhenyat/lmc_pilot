class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :number, null: false
      t.string :title,  null: false

      t.timestamps
    end
    add_index :departments, :number

    Department.create number: '01', title: 'Строительные материалы'
    Department.create number: '02', title: 'Столярные изделия'
    Department.create number: '03', title: 'Электротовары'
    Department.create number: '04', title: 'Инструменты'
    Department.create number: '05', title: 'Напольные покрытия'
    Department.create number: '06', title: 'Плитка'
    Department.create number: '07', title: 'Сантехника'
    Department.create number: '08', title: 'Водоснабжение'
    Department.create number: '09', title: 'Сад'
    Department.create number: '10', title: 'Скобяные изделия'
    Department.create number: '11', title: 'Краски'
    Department.create number: '12', title: 'Декоративно-отделочные материалы'
    Department.create number: '13', title: 'Освещение'
    Department.create number: '14', title: 'Хранение'
    Department.create number: '15', title: 'Кухни'
  end
end
