class Art < ApplicationRecord
    # include Filterable
    has_many :galleries
    has_many :viewers, through: :galleries

    # has_many :likes, dependent: :destroy

    # self.per_page = 20

    def self.search(query)
      where("title LIKE ?", "#%{query}%")
    end
    

    # scope :filter_by_location, -> (location_id) { where location_id: location_id }
    # scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
  end

