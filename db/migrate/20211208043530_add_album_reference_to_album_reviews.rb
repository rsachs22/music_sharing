class AddAlbumReferenceToAlbumReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :album_reviews, :albums
    add_index :album_reviews, :album_id
    change_column_null :album_reviews, :album_id, false
  end
end
