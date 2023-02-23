class AddVisitToArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :visits
  end
end
