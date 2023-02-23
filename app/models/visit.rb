class Visit < ApplicationRecord
  belongs_to :viewer, optional: true
  belongs_to :art, optional: true 
end
