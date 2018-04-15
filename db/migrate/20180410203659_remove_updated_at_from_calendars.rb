class RemoveUpdatedAtFromCalendars < ActiveRecord::Migration[5.1]
  def change
    remove_column :calendars, :updated_at, :datetime
  end
end
