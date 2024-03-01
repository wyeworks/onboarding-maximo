# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string
#  email             :string
#  password          :string
#  profile_photo_url :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  # has_one :profile, dependent: :destroy
  # has_many :posts, dependent: :destroy
  has_many :followers, foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :followers, source: :followed

  # Validations
  validates :username, presence: true
  validates :password, presence: true
  validates :profile_photo_url, presence: true
end


