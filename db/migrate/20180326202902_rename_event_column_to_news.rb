class RenameEventColumnToNews < ActiveRecord::Migration[5.1]
  def change
    rename_column :newsfeeds, :event, :news
  end
end
