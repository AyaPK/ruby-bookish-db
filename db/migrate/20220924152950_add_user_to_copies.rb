class AddUserToCopies < ActiveRecord::Migration[7.0]
  def change
    add_reference :copies, :user, foreign_key: true
  end
end
