class AlbumReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :body, :string
  attribute :title, :string
  attribute :stars, :string
  attribute :album_id, :integer

  # Direct associations

  belongs_to :album

  belongs_to :user

  # Indirect associations

  has_one    :artist

  filter :artist_id, :integer do
    eq do |scope, value|
      scope.eager_load(:artist).where(:albums => {:artist_id => value})
    end
  end
end
