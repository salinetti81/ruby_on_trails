class UpdateUsersNull < ActiveRecord::Migration
  def change
  	change_column :users, :first_name, :string, :null => true 
  	change_column :users, :last_name, :string, :null => true 
  	change_column :users, :about, :text, :null => true 
  end
end
