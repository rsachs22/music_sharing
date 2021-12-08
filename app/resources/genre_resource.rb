class GenreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :albums

  # Indirect associations

  has_many :songs do
    assign_each do |genre, songs|
      songs.select do |s|
        s.id.in?(genre.songs.map(&:id))
      end
    end
  end

end
