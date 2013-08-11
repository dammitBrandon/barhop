class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :event
      t.belongs_to :attendant

      t.timestamps
    end
  end
end
