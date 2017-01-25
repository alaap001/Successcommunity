class AddPostimageToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :Postimage, :string
  end
end
