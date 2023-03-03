class Art < ApplicationRecord
    belongs_to :viewer, optional: true
    belongs_to :gallery, optional: true
end
