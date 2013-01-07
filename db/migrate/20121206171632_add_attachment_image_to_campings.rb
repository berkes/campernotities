class AddAttachmentImageToCampings < ActiveRecord::Migration
  def self.up
    change_table :campings do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :campings, :image
  end
end
