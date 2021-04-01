class Actor < ApplicationRecord
    has_many :shows, through: :actors_shows
    has_many :characters

    validates :name, presence: true
    #add validation for dob being in the past and being a date 
end
