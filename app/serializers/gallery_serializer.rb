class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :arts, :created_at
  
  belongs_to :viewer
  belongs_to :arts
end
