class SongResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :album_id, :integer
  attribute :artist_id, :integer

  # Direct associations

  belongs_to :album

  has_many   :song_reviews

  # Indirect associations

end
