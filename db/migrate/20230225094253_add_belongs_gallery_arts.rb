class AddBelongsGalleryArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :gallery, index: true
  end
end
