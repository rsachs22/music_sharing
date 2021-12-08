class Api::V1::AlbumReviewsController < Api::V1::GraphitiController
  def index
    album_reviews = AlbumReviewResource.all(params)
    respond_with(album_reviews)
  end

  def show
    album_review = AlbumReviewResource.find(params)
    respond_with(album_review)
  end

  def create
    album_review = AlbumReviewResource.build(params)

    if album_review.save
      render jsonapi: album_review, status: 201
    else
      render jsonapi_errors: album_review
    end
  end

  def update
    album_review = AlbumReviewResource.find(params)

    if album_review.update_attributes
      render jsonapi: album_review
    else
      render jsonapi_errors: album_review
    end
  end

  def destroy
    album_review = AlbumReviewResource.find(params)

    if album_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: album_review
    end
  end
end
