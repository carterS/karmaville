class AddKarmapointsIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :karmapoints 
  end
end
