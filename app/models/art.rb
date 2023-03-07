class Art < ApplicationRecord
    include Filterable
    
    belongs_to :viewer, optional: true
    belongs_to :gallery, optional: true

    # self.per_page = 20

    def self.search(query)
      where("title LIKE ?", "#%{query}%")
    end
    

    # scope :filter_by_location, -> (location_id) { where location_id: location_id }
    # scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
  end

