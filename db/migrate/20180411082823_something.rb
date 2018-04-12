class Something < ActiveRecord::Migration[5.1]
  def change
	add_foreign_key :events, column: :calendar_id
  end
end
