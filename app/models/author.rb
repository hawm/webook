# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  after_touch do |author|
    author.destroy! if author.books.blank?
  end
end
