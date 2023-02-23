class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.belongs_to :viewer, null: false, foreign_key: true
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
