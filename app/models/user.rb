class User < ApplicationRecord
    has_many :comments
    has_many :viewings
    has_many :shows, through: :viewings
end
