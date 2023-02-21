class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.timestamps
    end
  end
end
