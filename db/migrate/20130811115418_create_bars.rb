class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.text   :description
      t.text   :address
      t.text   :url
    end
  end
end
