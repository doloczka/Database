class CreateZadaniaGlownes < ActiveRecord::Migration
  def change
    create_table :zadania_glownes do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.integer :poziom_zadania
      t.integer :nr_zadania
      t.integer :pkt_za_zadanie
      t.text :tresc
      t.text :podpowiedz

      t.timestamps null: false
    end
  end
end
