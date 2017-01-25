class CreateAims < ActiveRecord::Migration[5.0]
  def change
    create_table :aims do |t|
      t.string :head
      t.integer :day
      t.text :content

      t.timestamps
    end
  end
end
