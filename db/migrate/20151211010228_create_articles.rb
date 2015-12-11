class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :heading
      t.string :url
      t.text :description
      t.string :image
      t.text :excerpt
      t.date :date
      t.timestamps null: false
    end
  end
end
