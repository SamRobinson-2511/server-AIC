class Art < ApplicationRecord
    has_many :visits
    has_many :viewers, through: :visits
    belongs_to :viewer
    belongs_to :gallery
end
