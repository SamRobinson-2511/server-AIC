class AddFieldsToArts < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :artist_display, :string
    add_column :arts, :image_id, :string
    add_column :arts, :is_on_view, :boolean
  end
end
