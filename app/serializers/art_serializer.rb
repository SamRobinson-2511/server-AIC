class ArtSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist_display, :image_id, :gallery_id
  

  has_many :viewers

  
  # belongs_to :gallery, optional: true
  # has_many :likes
  # belongs_to :viewer
end
