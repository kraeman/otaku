class Show < ApplicationRecord
    has_many :actors, through: :actors_shows
    has_many :characters
end
