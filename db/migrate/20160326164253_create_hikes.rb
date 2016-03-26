class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
    	t.string :name
    	t.string :location
    	t.text :description
    	t.text :img_url
    end
  end

end