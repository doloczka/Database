class CreateZadaniaPobocznes < ActiveRecord::Migration
  def change
    create_table :zadania_pobocznes do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.integer :poziom_zadania
      t.text :zadanie_tresc
      t.integer :wyzywajacy
      t.text :odpowiedz_wyzywajacego
      t.integer :wyzwany
      t.text :odpowiedz_wyzwanego
      t.integer :status

      t.timestamps null: false
    end
  end
end