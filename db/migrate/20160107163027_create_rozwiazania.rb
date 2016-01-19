class CreateRozwiazania < ActiveRecord::Migration
  def change
    create_table :rozwiazania do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.text :tresc_zadania
      t.text :odpowiedz
      t.integer :punkty
      t.integer :przeczytana

      t.timestamps null: false
    end
  end
end
