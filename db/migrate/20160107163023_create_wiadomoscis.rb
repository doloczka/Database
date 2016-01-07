class CreateWiadomoscis < ActiveRecord::Migration
  def change
    create_table :wiadomoscis do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.text :tresc
      t.integer :przeczytana

      t.timestamps null: false
    end
  end
end
