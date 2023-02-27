class Gallery < ApplicationRecord
  has_one :viewer
  has_many :arts

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

end
