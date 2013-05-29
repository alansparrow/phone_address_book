class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from_phone_number
      t.string :to_phone_number
      t.string :content

      t.timestamps
    end
  end
end
