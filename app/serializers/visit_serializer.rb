class VisitSerializer < ActiveModel::Serializer
  attributes :id, :date, :comment, :viewer_id
  belongs_to :viewer
end
