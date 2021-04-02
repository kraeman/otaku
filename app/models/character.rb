class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor

  validates :name,  presence: true
  validates :bio, presence: true

  # def actor=(actor)
  #   @actor = find_actor(actor)
  # end

  # def find_actor(actor)
  #   self.show.actors.find{|a| a == actor}
  # end

  # def actor
  #   @actor || "Actor not casted yet"
  # end
end
