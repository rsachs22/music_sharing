class Artist < ApplicationRecord
  # Direct associations

  has_many   :songs,
             :dependent => :destroy

  has_many   :albums,
             :dependent => :destroy

  # Indirect associations

  has_many   :album_reviews,
             :through => :albums,
             :source => :album_reviews

  # Validations

  # Scopes

  def to_s
    artist_image
  end

end
