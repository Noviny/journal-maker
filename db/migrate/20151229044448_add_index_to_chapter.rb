class AddIndexToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :index, :string
  end
end
