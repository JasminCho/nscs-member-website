class AddUrlToOfficers < ActiveRecord::Migration[5.1]
  def change
    add_column :officers, :url, :string
  end
end
