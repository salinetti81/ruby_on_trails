class CreateHikesAndUsers < ActiveRecord::Migration
  def change
    create_table :hikes_and_users, id: false do |t|
    	t.belongs_to :hikes, index: true
    	t.belongs_to :users, index: true
    end
  end
end
