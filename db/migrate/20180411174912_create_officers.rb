class CreateOfficers < ActiveRecord::Migration[5.1]
  def change
    create_table :officers do |t|
      t.string :email
      t.string :position
      t.string :name
      t.string :major
      t.integer :year

      t.timestamps
    end
  end
end
