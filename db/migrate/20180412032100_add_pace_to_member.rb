class AddPaceToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :pace, :boolean
  end
end
