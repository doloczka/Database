class CreateWykladowcas < ActiveRecord::Migration
  def change
    create_table :wykladowcas do |t|
      t.string :imie
      t.string :nazwisko
      t.string :login
      t.string :haslo
      t.string :email

      t.timestamps null: false
    end
    add_index :wykladowcas, :login, unique: true
  end
end
