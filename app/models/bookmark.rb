# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_bookmarks_on_book_id  (book_id)
#  index_bookmarks_on_user_id  (user_id)
#
class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :book
end
