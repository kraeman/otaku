class Actor < ApplicationRecord
    has_many :shows, through: :actors_shows
    has_many :characters
end
