class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor

  validates :name,  presence: true
  validates :bio, presence: true

end
