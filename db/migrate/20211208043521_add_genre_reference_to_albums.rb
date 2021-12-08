class AddGenreReferenceToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :albums, :genres
    add_index :albums, :genre_id
    change_column_null :albums, :genre_id, false
  end
end
