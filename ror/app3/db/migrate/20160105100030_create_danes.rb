class CreateDanes < ActiveRecord::Migration
  def change
    create_table :danes do |t|
      t.referenes :user
      t.string :immie
      t.string :nazwisko

      t.timestamps null: false
    end
  end
end
