class AddNumberOfLoginsToUser < ActiveRecord::Migration
  def change
    add_column :users, :number_of_logins, :integer
  end
end
