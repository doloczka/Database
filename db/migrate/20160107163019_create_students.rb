class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :login
      t.string :haslo
      t.string :email
      t.string :imie
      t.string :nazwisko
      t.string :nralbumu
      t.references :grupy, index: true, foreign_key: true
      t.boolean :nr_logowania
      t.binary :avatar

      t.timestamps null: false
    end
    add_index :students, :login, unique: true
  end
end
