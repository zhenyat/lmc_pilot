class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.references :user,    null: false, index:   true
      t.boolean  :closed,    null: false, default: false
      t.integer  :max_level, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :assessments, :users
  end
end
