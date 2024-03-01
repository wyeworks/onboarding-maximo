# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :string
#  image_url   :string
#  date_add    :date
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
  # belongs_to :user

  # Validations
  # validates :description, allow_blank: true, length: {maximum: 300}
  # validates :image_url, presence: true
  # validates :date_add, presence: true
  # validates :user_id, presence: true

end