class Viewer < ApplicationRecord
    has_secure_password
    has_many :visits
    has_many :arts, through: :visits
    has_many :galleries
    has_many :arts, through: :galleries
    has_many :reviews
    
end
