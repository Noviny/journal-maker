class AddDescriptionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :description, :text
    add_column :books, :subheading, :string
    add_column :books, :status, :string
    add_column :books, :private, :boolean
  end
end
