class Api::V1::ArtistsController < Api::V1::GraphitiController
  def index
    artists = ArtistResource.all(params)
    respond_with(artists)
  end

  def show
    artist = ArtistResource.find(params)
    respond_with(artist)
  end

  def create
    artist = ArtistResource.build(params)

    if artist.save
      render jsonapi: artist, status: 201
    else
      render jsonapi_errors: artist
    end
  end

  def update
    artist = ArtistResource.find(params)

    if artist.update_attributes
      render jsonapi: artist
    else
      render jsonapi_errors: artist
    end
  end

  def destroy
    artist = ArtistResource.find(params)

    if artist.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: artist
    end
  end
end
