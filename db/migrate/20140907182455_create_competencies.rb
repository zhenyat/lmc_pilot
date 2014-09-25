class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.references :position, null: false, index: true
      t.references :cluster,  null: false, index: true
      t.string     :name,     null: false
      t.string     :title,    null: false
      t.integer    :rank,     null: false, default: 1
      t.string     :description

      t.timestamps
    end
    add_foreign_key :competencies, :positions
    add_foreign_key :competencies, :clusters
  end
end
