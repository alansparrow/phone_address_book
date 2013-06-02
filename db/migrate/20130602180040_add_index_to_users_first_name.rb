class AddIndexToUsersFirstName < ActiveRecord::Migration
  def change
  	add_index :users, :first_name
  end
end
