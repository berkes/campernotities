class AddNameToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :name, :string
  end
end
