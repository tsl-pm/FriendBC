class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :facebook_id
      t.string :from_name
      t.string :from_id
      t.text :message
      t.datetime :created_time
      t.integer :post_id

      t.timestamps
    end
  end
end
