class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :genre
      t.date :release_date
      t.string :plot_summary
      t.string :production
      t.string :poster
      t.string :website
      t.timestamps(null: false)
    end
  end
end
