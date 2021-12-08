class AddArtistReferenceToSongs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :songs, :artists
    add_index :songs, :artist_id
    change_column_null :songs, :artist_id, false
  end
end
