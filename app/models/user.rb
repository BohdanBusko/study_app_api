# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  password_digest        :string           default(""), not null
#  photo                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role                  (role)
#

require 'json_web_token'

class User < ApplicationRecord
  has_secure_password

  ADMIN = 'admin'.freeze
  USER = 'user'.freeze
  ROLES = [USER, ADMIN].freeze

  has_many :own_organizations, foreign_key: 'author_id', class_name: 'Organization'

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 16 }

  def full_name
    [first_name, last_name].join(' ')
  end

  def token
    JsonWebToken.encode({ user_id: id })
  end
end
