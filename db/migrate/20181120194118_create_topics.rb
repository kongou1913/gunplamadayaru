class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :grade
      t.string :series

      t.timestamps
    end
  end
end
