class User < ApplicationRecord
  has_one :movie

  has_many :user_movie
  has_many :movies, through: :user_movie

  # Validations
  validates :name, presence: true
  validates :ci, length: { in: 8..9 }, presence: true, allow_nil: false
  validate :valid_ci

  def valid_ci
    return unless ci

    unless ci.length == 8 || ci.length == 9
      errors.add(:ci, "Invalid CI, CI must contain 8 digits or 9 if you include \" - \"")
      return false
    end

    validation_number = ci[-1]
    digits = ci[0..6].chars.map(&:to_i) # Extract digits excluding the last one

    weights = [2, 9, 8, 7, 6, 3, 4]
    s = digits.zip(weights).sum { |digit, weight| digit * weight }
    m = s % 10
    h = (10 - m) % 10

    return unless h != validation_number.to_i

    errors.add(:ci, 'Invalid CI, Entered CI does not match the validation pattern')
  end

  def valid_age
    return unless birth > 18.years.ago

    errors.add(:birth, 'The user must be of legal age.')
  end
end