class RemoveCreatorNameFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :string
  end
end
