class UniquenessAdded < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :uniqueness => true
    change_column :users, :name, :string, :uniqueness => true
    change_column :articles, :url, :string, :uniqueness => true
    change_column :books, :status, :string, :default => 'Editing'
  end
end
