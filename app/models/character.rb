class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor, through: :shows

  validates :name,  presence: true
  validates :bio, presence: true
end
