class CreatePoint < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.string :email
      t.string :event_name
      t.integer :point
      t.timestamps
    end
  end
end
