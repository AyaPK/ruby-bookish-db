class AddImageUrlToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :imageUrl, :string
  end
end
