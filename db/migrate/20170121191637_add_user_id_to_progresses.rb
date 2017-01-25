class AddUserIdToProgresses < ActiveRecord::Migration[5.0]
  def change
    add_column :progresses, :user_id, :integer
  end
end
