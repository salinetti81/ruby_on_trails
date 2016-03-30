class DropJoinerTable < ActiveRecord::Migration
  def up
  	drop_table :hikes_and_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
