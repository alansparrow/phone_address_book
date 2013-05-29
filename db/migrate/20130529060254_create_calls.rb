class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :from_phone_number
      t.string :to_phone_number
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
