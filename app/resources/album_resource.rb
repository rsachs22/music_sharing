class AlbumResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :album_art, :string
  attribute :genre_id, :integer
  attribute :artist_id, :integer

  # Direct associations

  # Indirect associations

end
