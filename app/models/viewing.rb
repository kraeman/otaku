class Viewing < ApplicationRecord
  belongs_to :show
  belongs_to :user

  # validates :time
  validates :place, presence: true
end
