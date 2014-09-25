class CreateActioncards < ActiveRecord::Migration
  def change
    create_table :actioncards do |t|
      t.references :competency, null: false, index: true
      t.references :level,      null: false,index: true
      t.text       :content,    null: false

      t.timestamps
    end
    add_foreign_key :actioncards, :competencies
    add_foreign_key :actioncards, :levels
  end
end
