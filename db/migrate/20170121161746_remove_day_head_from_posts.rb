class RemoveDayHeadFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :day_head, :string
  end
end
