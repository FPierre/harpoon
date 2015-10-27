class UpdateArchitecture < ActiveRecord::Migration
  def change
     remove_column :articles, :category
     remove_column :articles, :tag
  end
end
