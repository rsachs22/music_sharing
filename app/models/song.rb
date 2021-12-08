class Song < ApplicationRecord
  # Direct associations

  belongs_to :artist

  belongs_to :album

  has_many   :song_reviews,
             :dependent => :destroy

  # Indirect associations

  has_one    :genre,
             :through => :album,
             :source => :genre

  # Validations

  # Scopes

  def to_s
    name
  end

end
