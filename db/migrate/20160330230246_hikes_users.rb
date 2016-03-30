class HikesUsers < ActiveRecord::Migration
  def change
  	create_table :hikes_users, id: false do |t|
  		t.belongs_to :hike, index: true
  		t.belongs_to :user, index: true
  	end
  end
end
