class AddMoreUserDetailsColumnsAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :username, :string
  end
end
