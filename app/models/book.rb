# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#
class Book < ApplicationRecord
  has_one_attached :document, dependent: :destory
  has_one_attached :cover_image, dependent: :destory
  belongs_to :author, touch: true
  accepts_nested_attributes_for :author

  attr_accessor :delete_cover_image, :delete_document

  before_validation do
    cover_image.purge if delete_cover_image == '1'
    document.purge if delete_document == '1'
  end

  validates :name, length: { minimum: 3, maximum: 50 }

  def autosave_associated_records_for_author
    self.author = Author.find_or_create_by(name: author.name.strip) if author.name.present?
  end
end
