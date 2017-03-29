class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.references :users, foreign_key: true
      t.references :movies, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
