class Show < ApplicationRecord
    has_many :actors, through: :actors_shows
    has_many :characters
    has_many :viewings
    has_many :users, through: :viewings
end
