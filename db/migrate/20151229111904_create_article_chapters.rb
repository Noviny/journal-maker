class CreateArticleChapters < ActiveRecord::Migration
  def change
    create_table :article_chapters do |t|

      t.timestamps null: false
    end
  end
end
