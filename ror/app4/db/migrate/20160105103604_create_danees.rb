class CreateDanees < ActiveRecord::Migration
  def change
    create_table :danees do |t|
      t.references :userr
      t.string :immie
      t.string :nazwisko

      t.timestamps null: false
    end
  end
end
