class Song < ApplicationRecord
  # Direct associations

  has_many   :song_reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
