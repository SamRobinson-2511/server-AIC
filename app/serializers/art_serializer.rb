class ArtSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist_display, :image_id
  
  has_many :galleries
  has_many :likes
end
