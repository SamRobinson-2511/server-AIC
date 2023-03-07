require 'date'

class ViewerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :zip_code, :recent_visitor?
  has_many :visits
  has_many :galleries
  has_many :arts, through: :galleries

  def recent_visitor?
    Date.today.prev_month < object.created_at
  end
end
