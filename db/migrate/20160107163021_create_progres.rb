class CreateProgres < ActiveRecord::Migration
  def change
    create_table :progres do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :pkt_rankingowe
      t.integer :zdrowie
      t.integer :doswiadczenie
      t.integer :level

      t.timestamps null: false
    end
  end
end
