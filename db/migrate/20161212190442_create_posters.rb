class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title
      t.string :poster_photo
      t.text :description
      t.integer :price
      t.string :type
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
