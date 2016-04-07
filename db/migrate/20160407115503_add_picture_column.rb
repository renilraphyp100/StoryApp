class AddPictureColumn < ActiveRecord::Migration
  def change
    add_column :authors, :picture, :string
    add_column :stories, :picture, :string
  end
end
