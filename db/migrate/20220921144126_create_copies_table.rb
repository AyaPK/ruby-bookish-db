class CreateCopiesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.string :Borrower
      t.string :DueDate
      t.integer :book_id
    end

    add_foreign_key :copies, :books
  end
end
