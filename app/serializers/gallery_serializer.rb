class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :art_id, :created_at
  has_many :arts
end
