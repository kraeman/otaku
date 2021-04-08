class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor
  has_one_attached :avatar

  validates :name,  presence: true
  validates :bio, presence: true
  accepts_nested_attributes_for :show

  

  default_scope { order(name: :asc) }
  scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
end
