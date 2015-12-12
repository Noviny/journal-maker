class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :topic
      t.string :style
      t.text :description

      t.timestamps null: false
    end
  end
end
