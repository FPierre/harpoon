class UpdateTagsFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :tags
    add_column    :news, :tag, :string, limit: 255
  end
end
