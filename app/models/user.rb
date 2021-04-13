class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :viewings
    has_many :shows, through: :viewings

    validates :name, presence: true
    validate date_in_future
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    def date_in_future
        if dob >= Time.now
            errors.add(:dob, " can not be in the future!")
        end
    end
end
