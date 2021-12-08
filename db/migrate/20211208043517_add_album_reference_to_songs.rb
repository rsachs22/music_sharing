class AddAlbumReferenceToSongs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :songs, :albums
    add_index :songs, :album_id
    change_column_null :songs, :album_id, false
  end
end
