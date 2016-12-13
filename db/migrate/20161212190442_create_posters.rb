class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title
      t.string :poster_photo
      t.text :description
      t.integer :price
      t.string :poster_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
