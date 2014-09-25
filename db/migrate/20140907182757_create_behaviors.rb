class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.references :competency, null: false, index: true
      t.references :level,      null: false, index: true
      t.text       :content,    null: false
      t.boolean    :active,     null: false, default: true

      t.timestamps
    end
    add_foreign_key :behaviors, :competencies
    add_foreign_key :behaviors, :levels
  end
end
