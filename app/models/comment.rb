class Comment < ApplicationRecord
  belongs_to :show
  belongs_to :user

  validates :content,  presence: true
end
