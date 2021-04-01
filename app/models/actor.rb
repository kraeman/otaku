class Actor < ApplicationRecord
    has_many :actors_shows
    has_many :shows, through: :actors_shows
    has_many :characters

    validates :name, presence: true
    #add validation for dob not being in the future
end
