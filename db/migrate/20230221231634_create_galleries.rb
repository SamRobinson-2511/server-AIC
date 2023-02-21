class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.belongs_to :viewer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
