class AddPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :picture, :string, :default => 'http://friendbc.herokuapp.com/assets/logo-e4306234a100473c9aab487c65c55863.png'
  end
end
