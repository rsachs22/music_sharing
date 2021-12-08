class ArtistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :artist_image, :string
  attribute :artist_bio, :string

  # Direct associations

  has_many   :songs

  has_many   :albums

  # Indirect associations

  has_many :album_reviews do
    assign_each do |artist, album_reviews|
      album_reviews.select do |a|
        a.id.in?(artist.album_reviews.map(&:id))
      end
    end
  end
end
