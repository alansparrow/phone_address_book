class AddIndexToCallsUsersIdAndCreatedAt < ActiveRecord::Migration
  def change
  	add_index :calls, [:user_id, :created_at]
  end
end
