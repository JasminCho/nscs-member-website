class CreateNewsfeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :newsfeeds do |t|
      t.string :event

      t.timestamps
    end
  end
end
