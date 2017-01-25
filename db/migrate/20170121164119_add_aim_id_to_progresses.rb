class AddAimIdToProgresses < ActiveRecord::Migration[5.0]
  def change
    add_column :progresses, :aim_id, :integer
    add_index :progresses, :aim_id
  end
end
