# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string
#  biography  :text
#  location   :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Profile < ApplicationRecord
  # belongs_to :user

  #   Validations
  # validates :name, presence: true
  # validates :biography, allow_blank: true, length: {maximum: 110}
  # validates :location, allow_blank: true
end
