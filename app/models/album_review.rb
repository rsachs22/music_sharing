class AlbumReview < ApplicationRecord
  # Direct associations

  belongs_to :album

  belongs_to :user

  # Indirect associations

  has_one    :artist,
             through: :album,
             source: :artist

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
