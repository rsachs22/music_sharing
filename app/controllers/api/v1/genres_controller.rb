class Api::V1::GenresController < Api::V1::GraphitiController
  def index
    genres = GenreResource.all(params)
    respond_with(genres)
  end

  def show
    genre = GenreResource.find(params)
    respond_with(genre)
  end

  def create
    genre = GenreResource.build(params)

    if genre.save
      render jsonapi: genre, status: 201
    else
      render jsonapi_errors: genre
    end
  end

  def update
    genre = GenreResource.find(params)

    if genre.update_attributes
      render jsonapi: genre
    else
      render jsonapi_errors: genre
    end
  end

  def destroy
    genre = GenreResource.find(params)

    if genre.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: genre
    end
  end
end
