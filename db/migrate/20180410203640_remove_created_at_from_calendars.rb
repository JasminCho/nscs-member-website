class RemoveCreatedAtFromCalendars < ActiveRecord::Migration[5.1]
  def change
    remove_column :calendars, :created_at, :datetime
  end
end
