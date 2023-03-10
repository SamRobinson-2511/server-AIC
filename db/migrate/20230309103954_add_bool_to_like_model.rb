class AddBoolToLikeModel < ActiveRecord::Migration[7.0]
  def change
    add_column :art_likes, :like, :bool
  end
end
