class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :facebook_id
      t.string :from_name
      t.string :from_id
      t.text :message
      t.datetime :created_time
      t.integer :likes
      t.integer :user_id
      t.string :link

      t.timestamps
    end
  end
end
