class AddPrefixToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :prefix, :string
  end
end
