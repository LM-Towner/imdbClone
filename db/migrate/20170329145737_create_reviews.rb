class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :text
      t.references :users, foreign_key: true
      t.references :movies, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
