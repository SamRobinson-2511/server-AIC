class AddImageToGallery < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :image_url, :string
  end
end
