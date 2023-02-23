class ChangeVisitsArtsId < ActiveRecord::Migration[7.0]
  def change
    rename_column :visits, :arts_id, :art_id
  end
end
