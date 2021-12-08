class Album < ApplicationRecord
  # Direct associations

  has_many   :album_reviews,
             :dependent => :destroy

  has_many   :songs,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
