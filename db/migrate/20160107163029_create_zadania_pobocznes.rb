class CreateZadaniaPobocznes < ActiveRecord::Migration
  def change
    create_table :zadania_pobocznes do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.references :grupy, index: true, foreign_key: true
      t.integer :poziom_zadania
      t.text :tresc
      t.text :podpowiedz

      t.timestamps null: false
    end
  end
end
