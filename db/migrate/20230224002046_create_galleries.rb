class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.belongs_to :viewer
      t.string :title
      t.string :description
      t.references :art

      t.timestamps
    end
  end
end
