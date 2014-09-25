class PopulateUsers < ActiveRecord::Migration
  def change
    store      = Store.find_by      name:   'lefortovo'

    ###########   Дирекция   ###########

    department = Department.find_by number: '00'

    # Store Director
    position   = Position.find_by   name: 'store_director'
    level      = Level.find_by      name: 'expert'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: '00000', last_name: 'Xxx', first_name: 'Yyy', middle_name: 'Zzz',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # HR
    position   = Position.find_by   name: 'hr'
    level      = Level.find_by      name: 'expert'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                    login: 'smirnova', last_name: 'Смирнова', first_name: 'Ольга',
                    active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Столярные изделия   ###########

    department = Department.find_by number: '02'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '24540', last_name: 'Чекранов', first_name: 'Владимир', middle_name: 'Геннадьевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'beginner'
    manager    = User.find_by       login: '24540'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16030', last_name: 'Порываев', first_name: 'Игорь', middle_name: 'Анатольевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '26500', last_name: 'Мастяев', first_name: 'Александр', middle_name: 'Дмитриевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    level      = Level.find_by      name: 'specialist'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10027', last_name: 'Самойлович', first_name: 'Светлана', middle_name: 'Владимировна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '15532', last_name: 'Лимберов', first_name: 'Сергей', middle_name: 'Николаевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Электротовары   ###########

    department = Department.find_by number: '03'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10657', last_name: 'Богомазов', first_name: 'Михаил', middle_name: 'Михайлович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '10657'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '13013', last_name: 'Зимин', first_name: 'Дмитрий', middle_name: 'Аверьянович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '3125', last_name: 'Егоров', first_name: 'Александр', middle_name: 'Геннадьевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Инструменты   ###########

    department = Department.find_by number: '04'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '5471', last_name: 'Лобанов', first_name: 'Владимир', middle_name: 'Станиславович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'beginner'
    manager    = User.find_by       login: '5471'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '26221', last_name: 'Кашапова', first_name: 'Лейсания', middle_name: 'Фирдависовна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    level      = Level.find_by      name: 'specialist'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10226', last_name: 'Лаухин', first_name: 'Станислав', middle_name: 'Сергеевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '19358', last_name: 'Ерофеев', first_name: 'Александр', middle_name: 'Иванович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Настенная и напольная плитка   ###########

    department = Department.find_by number: '06'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16818', last_name: 'Нагорный', first_name: 'Юрий', middle_name: 'Владимирович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '16818'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '15539', last_name: 'Шашкова', first_name: 'Татьяна', middle_name: 'Юрьевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16962', last_name: 'Погосян', first_name: 'Армен', middle_name: 'Арамаисович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '19942', last_name: 'Чибаева', first_name: 'Виктория', middle_name: 'Феликсовна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Сантехника   ###########

    department = Department.find_by number: '07'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16970', last_name: 'Новикова', first_name: 'Елена', middle_name: 'Сергеевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '16970'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10146', last_name: 'Крюкова', first_name: 'Зоя', middle_name: 'Сергеевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Сад   ###########

    department = Department.find_by number: '09'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '24655', last_name: 'Робер', first_name: 'Робер', middle_name: '',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'beginner'
    manager    = User.find_by       login: '24655'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '9915', last_name: 'Пастухова', first_name: 'Татьяна', middle_name: 'Борисовна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10590', last_name: 'Алексахина', first_name: 'Светлана', middle_name: 'Михайловна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    level      = Level.find_by      name: 'specialist'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '12728', last_name: 'Лебедева', first_name: 'Елена', middle_name: 'Павловна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '13425', last_name: 'Врабий', first_name: 'Светлана', middle_name: 'Сергеевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Краски   ###########

    department = Department.find_by number: '11'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '14761', last_name: 'Чепланов', first_name: 'Артем', middle_name: 'Борисович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '14761'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10196', last_name: 'Игнатьева', first_name: 'Алла', middle_name: 'Федоровна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16888', last_name: 'Магомедов', first_name: 'Мурад', middle_name: 'Баширович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '20853', last_name: 'Карпчук', first_name: 'Наталья', middle_name: 'Анатольевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Декоративно-отделочные материалы   ###########

    department = Department.find_by number: '12'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '3999', last_name: 'Кокушкин', first_name: 'Никита', middle_name: 'Александрович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '3999'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '12801', last_name: 'Макарова', first_name: 'Екатерина', middle_name: 'Евгеньевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16207', last_name: 'Белова', first_name: 'Татьяна', middle_name: 'Валентиновна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########  Хранение   ###########

    department = Department.find_by number: '14'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '24540_', last_name: 'Чекранов', first_name: 'Владимир', middle_name: 'Геннадьевич',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'beginner'
    manager    = User.find_by       login: '24540_'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '17063', last_name: 'Балтаев', first_name: 'Хамра', middle_name: 'Александрович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Кухни   ###########

    department = Department.find_by number: '15'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16818_', last_name: 'Нагорный', first_name: 'Юрий', middle_name: 'Владимирович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'specialist'
    manager    = User.find_by       login: '16818_'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10223', last_name: 'Журавлев', first_name: 'Илья', middle_name: 'Борисович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10224', last_name: 'Харизов', first_name: 'Игорь', middle_name: 'Олегович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '10344', last_name: 'Вербецкая', first_name: 'Юлия', middle_name: 'Александровна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '16483', last_name: 'Панина', first_name: 'Елена', middle_name: 'Анатольевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '17109', last_name: 'Истомина', first_name: 'Татьяна', middle_name: 'Ивановна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Тестирование   ###########

    department = Department.find_by number: '98'

    # Manager
    position   = Position.find_by   name: 'sector_head'
    level      = Level.find_by      name: 'master'
    manager    = User.find_by       login: '00000'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '11111', last_name: 'Иванов', first_name: 'Иван', middle_name: 'Иванович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    # Employees
    position   = Position.find_by   name: 'seller'
    level      = Level.find_by      name: 'beginner'
    manager    = User.find_by       login: '11111'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '11112', last_name: 'Петров', first_name: 'Петр', middle_name: 'Петрович',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    level      = Level.find_by      name: 'specialist'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id, manager_id: manager.id,
                login: '11113', last_name: 'Зотова', first_name: 'Зоя', middle_name: 'Зиновьевна',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'

    ###########   Администраторы системы   ###########

    # Admins
    store      = Store.find_by      name:   'co'
    department = Department.find_by number: '99'
    position   = Position.find_by   name:   'admin'
    level      = Level.find_by      name:   'expert'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: 'leysyan', last_name: 'Телюкова', first_name: 'Лейсян',
                active: true, password: 'Rada-2007', password_confirmation: 'Rada-2007'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: 'christophe', last_name: 'Boulanger', first_name: 'Christophe',
                active: true, password: 'LMC-2014', password_confirmation: 'LMC-2014'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: 'aleksey', last_name: 'Пашкин', first_name: 'Алексей',
                active: true, password: 'LMC-2014', password_confirmation: 'LMC-2014'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: 'zt', last_name: 'Телюков', first_name: 'Евгений',
                active: true, password: 'Rada-2007', password_confirmation: 'Rada-2007'

    ###########  Гости   ###########

    store      = Store.find_by      name:   'lefortovo'
    department = Department.find_by number: '97'
    position   = Position.find_by   name:   'seller'
    level      = Level.find_by      name:   'beginner'

    User.create store_id: store.id, department_id: department.id, position_id: position.id, level_id: level.id,
                login: 'guest', last_name: 'Гость', first_name: 'Леруа', middle_name: 'Мерлен',
                active: true, password: 'Passwd1', password_confirmation: 'Passwd1'
  end
end
