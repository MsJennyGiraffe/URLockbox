class AddSiteNameToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :site_name, :string
    add_column :links, :h1, :string
  end
end
