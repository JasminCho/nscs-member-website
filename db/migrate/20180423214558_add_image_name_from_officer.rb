class AddImageNameFromOfficer < ActiveRecord::Migration[5.1]
  def change
    add_column :officers, :image_name, :string
  end
end
