class AddWebsiteIdToArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :website

    add_reference :articles, :website, index: true
    add_foreign_key :articles, :websites
  end
end
