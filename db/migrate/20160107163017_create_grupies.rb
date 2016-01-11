class CreateGrupies < ActiveRecord::Migration
  def change
    create_table :grupies do |t|
      t.references :wykladowca, index: true, foreign_key: true
      t.text :nazwa
      t.timestamps null: false
    end
    add_index :grupies, :wykladowca_id
    add_index :grupies, :student_id
    add_index :grupies, [:wykladowca_id, :student_id], unique: true
  end
end
