class CreateArtciles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url,      limit: 255
      t.string :tag,      limit: 255
      t.string :title,    limit: 255
      t.string :website,  limit: 255
      t.string :category, limit: 255

      t.timestamps null: false
    end
  end
end
