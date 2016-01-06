class CreateRozwiazania < ActiveRecord::Migration
  def change
    create_table :rozwiazania do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.text :tresc_zadania
      t.text :odpowiedz
      t.integer :przeczytana
      t.date :data
      t.time :godzina

      t.timestamps null: false
    end
  end
end
