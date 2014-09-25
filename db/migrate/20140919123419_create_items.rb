class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :assessment, null: false, index:   true
      t.references :behavior,   null: false, index:   true
      t.boolean    :user_tick,  null: false, default: false
      t.boolean    :final_tick, null: false, default: false

      t.timestamps
    end
    add_foreign_key :items, :assessments
    add_foreign_key :items, :behaviors
  end
end
