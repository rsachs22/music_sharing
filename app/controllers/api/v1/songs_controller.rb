class Api::V1::SongsController < Api::V1::GraphitiController
  def index
    songs = SongResource.all(params)
    respond_with(songs)
  end

  def show
    song = SongResource.find(params)
    respond_with(song)
  end

  def create
    song = SongResource.build(params)

    if song.save
      render jsonapi: song, status: 201
    else
      render jsonapi_errors: song
    end
  end

  def update
    song = SongResource.find(params)

    if song.update_attributes
      render jsonapi: song
    else
      render jsonapi_errors: song
    end
  end

  def destroy
    song = SongResource.find(params)

    if song.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: song
    end
  end
end
