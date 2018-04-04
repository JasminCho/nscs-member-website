class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :event_id
      t.string :creator_name
      t.string :creator_email
      t.string :location

      t.timestamps
    end
  end
end
