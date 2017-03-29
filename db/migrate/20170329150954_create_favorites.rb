class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :users, foreign_key: true
      t.references :movies, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
