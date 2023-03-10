# require 'date'

class ViewerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :zip_code
  has_many :galleries
  has_many :arts

end

#   def recent_visitor?
#     Date.today.prev_month < object.created_at
#   end
# end
