class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :url
      t.string :date

      t.timestamps
    end
  end
end
