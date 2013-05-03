class AddWebsiteToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :website, :string
  end
end
