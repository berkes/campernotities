class AddLatitudeAndLongitudeToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :latitude,  :decimal, :precision => 15, :scale => 10
    add_column :campings, :longitude, :decimal, :precision => 15, :scale => 10
  end
end
