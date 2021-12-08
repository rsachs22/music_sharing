class AlbumResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :album_art, :string
  attribute :genre_id, :integer
  attribute :artist_id, :integer

  # Direct associations

  belongs_to :genre

  belongs_to :artist

  has_many   :album_reviews

  has_many   :songs

  # Indirect associations
end
