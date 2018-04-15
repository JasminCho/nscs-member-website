class RemoveCalendarIdFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :calendar_id, :string
  end
end
