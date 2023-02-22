class AddViewerToArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :viewer, foreign_key: true
    add_reference :arts, :visit, foreign_key: true
    add_reference :arts, :gallery, foreign_key: true
  end
end
