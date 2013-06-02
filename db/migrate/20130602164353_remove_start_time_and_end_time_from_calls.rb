class RemoveStartTimeAndEndTimeFromCalls < ActiveRecord::Migration
  def up
  	remove_column :calls, :start_time
  	remove_column :calls, :end_time
  end

  def down
  	add_column :calls, :start_time, :string
  	add_column :calls, :end_time, :string
  end
end
