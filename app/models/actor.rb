class Actor < ApplicationRecord
    has_many :actors_shows
    has_many :shows, through: :actors_shows
    has_many :characters

    validates :name, presence: true
    #add validation for dob not being in the future
    default_scope { order(name: :asc) }
    scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
end
