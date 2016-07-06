class CreateEventAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
