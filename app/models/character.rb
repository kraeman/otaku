class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor
  has_one_attached :avatar

  validates :name,  presence: true
  validates :bio, presence: true


  def show_attributes=(show)
    self.show = Show.find_or_create_by(title: show[:title])
    self.show.update(show)
  end

  default_scope { order(name: :asc) }
  scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}
end
