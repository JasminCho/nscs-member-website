class AddS3ObjToUpload < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :S3Obj, :string
  end
end
