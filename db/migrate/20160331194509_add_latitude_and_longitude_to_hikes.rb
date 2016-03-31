class AddLatitudeAndLongitudeToHikes < ActiveRecord::Migration
  def change
    add_column :hikes, :latitude, :float
    add_column :hikes, :longitude, :float
  end
end
