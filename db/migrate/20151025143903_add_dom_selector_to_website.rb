class AddDomSelectorToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :dom_selector, :string
  end
end
