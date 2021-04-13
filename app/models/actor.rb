class Actor < ApplicationRecord
    has_many :actors_shows
    has_many :shows, through: :actors_shows
    has_many :characters, dependent: :delete_all

    validates :name, presence: true
    validates :dob, presence: true
    validate :date_in_future
    
    default_scope { order(name: :asc) }
    scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
private
  
    def date_in_future
        if dob && dob >= Time.now
            errors.add(:dob, " can not be in the future!")
        end
    end
end
  
