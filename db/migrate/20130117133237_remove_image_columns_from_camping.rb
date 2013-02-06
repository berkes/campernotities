class RemoveImageColumnsFromCamping < ActiveRecord::Migration
  def self.up
    drop_attached_file :campings, :image
  end

  def self.down
    change_table :campings do |t|
      t.has_attached_file :image
    end
  end
end
