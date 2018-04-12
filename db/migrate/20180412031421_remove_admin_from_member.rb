class RemoveAdminFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :admin, :boolean
  end
end
