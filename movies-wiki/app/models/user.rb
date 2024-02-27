class User < ApplicationRecord
  has_one :movie

  has_many :user_movie
  has_many :movies, through: :user_movie

  # Validations
  validates :name, presence: true
  validates :ci, length: { in: 8..9 }, presence: true, allow_nil: false
  validate :valid_ci

  def valid_ci
    if ci
      if ci.length < 8 || ci.length > 9
        puts 'wrong length'
        return false
      end
      validationNumber = ci[-1, 1].to_s
      a, b, c, d, e, f, g = ci.to_s.split('').map(&:to_i)
      s = 2 * a + 9 * b + 8 * c + 7 * d + 6 * e + 3 * f + 4 * g

      m = s % 10
      # puts "m: #{m}"
      h = (10 - m)
      # puts "h: #{h.class}"
      # puts "validationNumber #{validationNumber.class}"
      return unless h.to_s != validationNumber

      errors.add(:ci, 'Invalid CI, Entered CI does not match the validation pattern')
    end
    return false
  end

  def valid_age
    return unless birth_date > 18.years.ago.to_date

    errors.add(:birth_date, 'The user must be of legal age.')
  end
end
