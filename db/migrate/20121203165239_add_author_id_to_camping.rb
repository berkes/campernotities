class AddAuthorIdToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :author_id, :integer
  end
end
