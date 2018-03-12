class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :email
      t.string :name
      t.boolean :admin
      t.integer :hours

      t.timestamps
    end
  end
end
