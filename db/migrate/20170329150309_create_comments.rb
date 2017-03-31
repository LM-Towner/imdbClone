class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, foreign_key: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.timestamps(null: false)
    end
  end
end
