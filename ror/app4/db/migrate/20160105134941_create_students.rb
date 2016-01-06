class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :login
      t.string :haslo
      t.string :kontakt
      t.string :imie
      t.string :nazwisko
      t.string :nralbumu
      t.references :grupy, index: true, foreign_key: true
      t.integer :nr_logowania

      t.timestamps null: false
    end
    add_index :students, :login, unique: true
  end
end
