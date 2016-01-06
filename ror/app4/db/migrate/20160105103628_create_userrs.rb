class CreateUserrs < ActiveRecord::Migration
  def change
    create_table :userrs do |t|
      t.string :username
      t.string :password
      t.string :email
      t.date :register_date

      t.timestamps null: false
    end
  end
end
