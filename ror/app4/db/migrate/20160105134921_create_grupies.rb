class CreateGrupies < ActiveRecord::Migration
  def change
    create_table :grupies do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.text :nazwa

      t.timestamps null: false
    end
  end
end
