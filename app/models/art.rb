class Art < ApplicationRecord
    has_many :visits
    has_many :viewers, through: :visits

end
