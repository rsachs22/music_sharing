class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :album_art
      t.integer :genre_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
