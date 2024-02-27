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
  
    scope :action, -> { where(genre: 'Action') }
    scope :drama, -> { where(genre: 'Drama') }
    scope :comedy, -> { where(genre: 'Comedy') }
    scope :science_fiction, -> { where(genre: 'Science Fiction') }
    scope :history, -> { where(genre: 'History') }
    scope :horror, -> { where(genre: 'Horror') }
    scope :suspense, -> { where(genre: 'Suspense') }
    scope :fantasy, -> { where(genre: 'Fantasy') }
  end
  