class Movie < ApplicationRecord
  belongs_to :director, class_name: 'User'
  belongs_to :source

  has_many :user_movies
  has_many :actors, through: :user_movies, source: :user

  # Validations before save into database
  validates_associated :director
  validates_associated :source
  validates_associated :user_movies

  validates :title, presence: true
  validates :genre, presence: true

  # Enum for movie genres
  enum genre: {
    action: 'Action',
    drama: 'Drama',
    comedy: 'Comedy',
    sci_fi: 'Science Fiction',
    history: 'History',
    horror: 'Horror',
    suspense: 'Suspense',
    fantasy: 'Fantasy'
  }
end