class AddPublicIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :public_id, :string

    Article.all.each do |article|
      article.set_public_id
      article.save
    end
  end
end
