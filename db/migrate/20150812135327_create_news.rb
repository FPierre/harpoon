class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :website
      t.string :url
      t.text :tags

      t.timestamps null: false
    end
  end
end
