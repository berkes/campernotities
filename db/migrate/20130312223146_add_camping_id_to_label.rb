class AddCampingIdToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :camping_id, :integer
  end
end
