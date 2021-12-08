class SongResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :album_id, :integer
  attribute :artist_id, :integer

  # Direct associations

  belongs_to :artist

  belongs_to :album

  has_many   :song_reviews

  # Indirect associations

  has_one    :genre

  filter :genre_id, :integer do
    eq do |scope, value|
      scope.eager_load(:genre).where(:albums => {:genre_id => value})
    end
  end
end
