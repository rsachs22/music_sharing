class Song < ApplicationRecord
  # Direct associations

  belongs_to :album

  has_many   :song_reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
