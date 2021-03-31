class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor, through: :shows
end
