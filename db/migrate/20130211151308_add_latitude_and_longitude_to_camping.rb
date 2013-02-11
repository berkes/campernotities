class AddLatitudeAndLongitudeToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :latitude, :float
    add_column :campings, :longitude, :float
  end
end
