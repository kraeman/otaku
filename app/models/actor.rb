class Actor < ApplicationRecord
    has_many :actors_shows
    has_many :shows, through: :actors_shows
    has_many :characters

    validates :name, presence: true
    validate :date_in_future
    validates :dob, presence: true
    default_scope { order(name: :asc) }
    scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
private
  
    def date_in_future
        if dob >= Time.now
            errors.add(:dob, " can not be in the future!")
        end
    end
end
  
