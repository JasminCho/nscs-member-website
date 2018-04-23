class RemoveImageFromOfficer < ActiveRecord::Migration[5.1]
  def change
    remove_column :officers, :image, :string
  end
end
