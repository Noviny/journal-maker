class ArticlesBooks < ActiveRecord::Migration
  def change
    create_table :articles_books, :id => false do |t|
      t.integer :article_id
      t.integer :book_id
    end
  end
end
