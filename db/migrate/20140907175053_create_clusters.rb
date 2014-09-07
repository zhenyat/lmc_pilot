class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string  :name,      null: false
      t.string  :title,     null: false
      t.boolean :mutual, default: false
      t.text    :description

      t.timestamps
    end
    add_index :clusters, :name

    Cluster.create name: 'functional',  title: 'Функциональные'
    Cluster.create name: 'personality', title: 'Личностные',     mutual: true
    Cluster.create name: 'managerial',  title: 'Управленческие', mutual: true
    Cluster.create name: 'strategical', title: 'Стратегические'
  end
end
