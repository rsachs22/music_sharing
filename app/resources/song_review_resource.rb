class SongReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :body, :string
  attribute :title, :string
  attribute :stars, :string
  attribute :song_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end
