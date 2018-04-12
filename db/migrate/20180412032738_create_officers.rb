class CreateOfficers < ActiveRecord::Migration[5.1]
  def change
    create_table :officers do |t|
      t.string :email
      t.string :name
      t.string :position
      t.string :major
      t.string :year

      t.timestamps
    end
  end
end
