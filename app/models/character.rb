class Character < ApplicationRecord
  belongs_to :show
  belongs_to :actor
  has_one_attached :avatar, dependent: :delete_all

  validates :name,  presence: true
  validates :bio, presence: true
  accepts_nested_attributes_for :show

  

  default_scope { order(name: :asc) }
  scope :search_by_name, -> (name) {where("name LIKE ?", "#{name}%")}


    def self.find_in_context_of_show(character_params)
        Show.find(character_params[:show_attributes][:id])
    end

    def self.find_in_context_of_show_but_not_hacked(character_params)
        Show.find(character_params[:show_attributes][:id])
    end

end
