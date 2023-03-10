class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at
  
  belongs_to :viewer  
  belongs_to :art

end
