class Show < ApplicationRecord
    has_many :actors_shows
    has_many :actors, through: :actors_shows
    has_many :characters
    has_many :viewings
    has_many :users, through: :viewings
    accepts_nested_attributes_for :characters

    validates :title, presence: true, uniqueness: true
    #validates air time as a length of time
    validates :rating, numericality: true, presence: true
    default_scope { order(title: :asc) }
    scope :search_by_title, -> (title) {where("title LIKE ?", "#{title}%")}
end
