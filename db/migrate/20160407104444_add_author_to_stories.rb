class AddAuthorToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :author, index: true
  end
end
