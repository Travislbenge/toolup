class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user_id, foreign_key: true
      t.references :tool_id, foreign_key: true

      t.timestamps
    end
  end
end
