class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string 'email'
      t.string 'name'
    end
  end
end
