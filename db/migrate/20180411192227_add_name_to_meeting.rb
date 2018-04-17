class AddNameToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :name, :string
  end
end
