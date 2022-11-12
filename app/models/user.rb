# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  is_admin        :boolean          default(FALSE)
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  attr_accessor :skip_username_validations

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 10 },
                       format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
                       unless: :skip_username_validations
  after_validation { self.username = username.downcase }
end
