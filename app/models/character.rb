class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor

  validates :name,  presence: true
  validates :bio, presence: true


  scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
end
