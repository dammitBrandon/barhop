class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :name
      t.text       :location
      t.string     :starts_at
      t.string     :ends_at
      t.belongs_to :creator

      t.timestamps
    end
  end
end
