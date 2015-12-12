class BookShelf < ActiveRecord::Migration
  def change
    create_table :books_shelves, :id => false do |t|
      t.integer :shelf_id
      t.integer :book_id
    end
  end
end
