class Viewing < ApplicationRecord
  belongs_to :show
  belongs_to :user

  validates :time, presence: true
  validates :place, presence: true
end
