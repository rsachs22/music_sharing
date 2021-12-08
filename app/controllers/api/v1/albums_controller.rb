class Api::V1::AlbumsController < Api::V1::GraphitiController
  def index
    albums = AlbumResource.all(params)
    respond_with(albums)
  end

  def show
    album = AlbumResource.find(params)
    respond_with(album)
  end

  def create
    album = AlbumResource.build(params)

    if album.save
      render jsonapi: album, status: :created
    else
      render jsonapi_errors: album
    end
  end

  def update
    album = AlbumResource.find(params)

    if album.update_attributes
      render jsonapi: album
    else
      render jsonapi_errors: album
    end
  end

  def destroy
    album = AlbumResource.find(params)

    if album.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: album
    end
  end
end
