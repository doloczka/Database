class CreateWylosowaneZadania < ActiveRecord::Migration
  def change
    create_table :wylosowane_zadania do |t|
      t.integer :poziom
      t.integer :numer
      t.references :student, index: true, foreign_key: true
      t.references :zadania_glowne, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
