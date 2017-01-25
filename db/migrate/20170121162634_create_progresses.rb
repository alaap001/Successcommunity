class CreateProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :progresses do |t|
      t.string :progress_head
      t.text :content

      t.timestamps
    end
  end
end
