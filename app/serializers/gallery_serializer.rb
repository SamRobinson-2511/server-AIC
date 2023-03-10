class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :art, :created_at
  belongs_to :viewer  
  belongs_to :art

end
