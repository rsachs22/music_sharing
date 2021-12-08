class ArtistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :artist_image, :string
  attribute :artist_bio, :string

  # Direct associations

  has_many   :albums

  # Indirect associations

end
