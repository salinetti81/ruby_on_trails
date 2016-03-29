class UpdateUsers < ActiveRecord::Migration
  def change
  	change_column :users, :first_name, :string, :null => false
  	change_column :users, :last_name, :string, :null => false
  	change_column :users, :about, :text, :null => false
  end
end
