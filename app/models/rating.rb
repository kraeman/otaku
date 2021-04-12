class Rating < ApplicationRecord
    belongs_to :show
    belongs_to :user
  
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, presence: true
  end
  