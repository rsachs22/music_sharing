class Album < ApplicationRecord
  # Direct associations

  belongs_to :genre

  belongs_to :artist

  has_many   :album_reviews,
             dependent: :destroy

  has_many   :songs,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
