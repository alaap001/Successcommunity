class AddProgressimageIdToProgresses < ActiveRecord::Migration[5.0]
  def change
    add_column :progresses, :Progressimage, :string
  end
end
