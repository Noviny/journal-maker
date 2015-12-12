class ArticleChapter < ActiveRecord::Migration
  def change
    create_table :articles_chapters, :id => false do |t|
      t.integer :article_id
      t.integer :chapter_id
    end
  end
end

