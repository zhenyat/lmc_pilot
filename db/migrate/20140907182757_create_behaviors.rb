class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.integer :competency_id, null: false
      t.integer :level_id,      null: false
      t.text    :content,       null: false
      t.boolean :active,        null: false, default: true
      
      t.timestamps
    end
  end
end
