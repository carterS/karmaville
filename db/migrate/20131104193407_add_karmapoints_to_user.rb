class AddKarmapointsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :karmapoints, :integer
  	User.reset_column_information
  	User.all.each do |u|
  		u.update_attribute :karmapoints, u.total_karma
  	end
  end
end
