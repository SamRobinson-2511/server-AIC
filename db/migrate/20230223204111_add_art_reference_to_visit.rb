class AddArtReferenceToVisit < ActiveRecord::Migration[7.0]
  def change
    add_reference :visits, :arts
  end
end
