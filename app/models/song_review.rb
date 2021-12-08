class SongReview < ApplicationRecord
  # Direct associations

  belongs_to :song

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
