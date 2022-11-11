class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.belongs_to :author, index: true, foreign_key: true
      t.timestamps
    end
  end
end
