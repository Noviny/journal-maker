class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :name
      t.integer :book_id
      t.integer :position
      t.timestamps null: false
    end
  end
end
