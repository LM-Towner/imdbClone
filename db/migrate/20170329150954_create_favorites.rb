class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
