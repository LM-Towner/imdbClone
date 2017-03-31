class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
