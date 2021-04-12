class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :viewings
    has_many :shows, through: :viewings
    has_many :ratings

    validates :name, presence: true
    # validates :dob
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    # validates :password, presence: true

    
end
