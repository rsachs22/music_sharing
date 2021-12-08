class Genre < ApplicationRecord
  # Direct associations

  has_many   :albums,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
