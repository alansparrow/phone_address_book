class AddIndexToMessagesUsersIdAndCreatedAt < ActiveRecord::Migration
  def change
  	add_index :messages, [:user_id, :created_at]
  end
end
