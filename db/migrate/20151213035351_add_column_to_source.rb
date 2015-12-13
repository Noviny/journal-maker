class AddColumnToSource < ActiveRecord::Migration
  def change
    add_column :sources, :domain, :string
  end
end
