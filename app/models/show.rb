class Show < ApplicationRecord
    has_many :actors, through: :actors_shows
    has_many :characters
    has_many :viewings
    has_many :users, through: :viewings

    validates :title, presence: true, uniqueness: true
    #validates air time as a length of time
    validates :rating, numericality: true, presence: true
end
