class AddArtistReferenceToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :albums, :artists
    add_index :albums, :artist_id
    change_column_null :albums, :artist_id, false
  end
end
