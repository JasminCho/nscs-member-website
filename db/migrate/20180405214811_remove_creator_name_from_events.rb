class RemoveCreatorNameFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :field_name, :string
  end
end
