class Genre < ApplicationRecord
  # Direct associations

  has_many   :albums,
             dependent: :destroy

  # Indirect associations

  has_many   :songs,
             through: :albums,
             source: :songs

  # Validations

  # Scopes

  def to_s
    name
  end
end
