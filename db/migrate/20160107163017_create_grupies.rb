class CreateGrupies < ActiveRecord::Migration
  def change
    create_table :grupies do |t|
      t.text :nazwa
      t.references :wykladowca, index: true, foreign_key: true
      t.timestamps null: false
    end
    #add_index :grupies, :wykladowca_id
  end
end
