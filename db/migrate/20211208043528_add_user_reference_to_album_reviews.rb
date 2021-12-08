class AddUserReferenceToAlbumReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :album_reviews, :users
    add_index :album_reviews, :user_id
    change_column_null :album_reviews, :user_id, false
  end
end
