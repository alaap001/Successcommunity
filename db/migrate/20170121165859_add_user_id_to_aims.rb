class AddUserIdToAims < ActiveRecord::Migration[5.0]
  def change
    add_column :aims, :user_id, :integer
  end
end
