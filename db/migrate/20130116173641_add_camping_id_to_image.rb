class AddCampingIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :camping_id, :integer
  end
end
