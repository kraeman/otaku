class Show < ApplicationRecord
    # has_many :actors_shows, dependent: :delete_all
    has_many :characters, dependent: :delete_all
    has_many :actors, through: :characters
    
    has_many :viewings, dependent: :delete_all
    has_many :users, through: :viewings
    has_many :comments, dependent: :delete_all
    

    validates :title, presence: true, uniqueness: true
    validates :air_time, numericality: {only_integer: false, greater_than_or_equal_to: 0}, presence: true
    default_scope { order(title: :asc) }
    scope :search_by_title, -> (title) {where("title LIKE ?", "#{title}%")}



    
end
