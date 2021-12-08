class CreateAlbumReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :album_reviews do |t|
      t.integer :user_id
      t.string :body
      t.string :title
      t.string :stars
      t.integer :album_id

      t.timestamps
    end
  end
end
