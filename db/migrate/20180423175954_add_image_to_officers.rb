class AddImageToOfficers < ActiveRecord::Migration[5.1]
  def change
    add_column :officers, :image, :string
  end
end
