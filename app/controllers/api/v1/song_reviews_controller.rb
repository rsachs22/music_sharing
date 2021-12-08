class Api::V1::SongReviewsController < Api::V1::GraphitiController
  def index
    song_reviews = SongReviewResource.all(params)
    respond_with(song_reviews)
  end

  def show
    song_review = SongReviewResource.find(params)
    respond_with(song_review)
  end

  def create
    song_review = SongReviewResource.build(params)

    if song_review.save
      render jsonapi: song_review, status: 201
    else
      render jsonapi_errors: song_review
    end
  end

  def update
    song_review = SongReviewResource.find(params)

    if song_review.update_attributes
      render jsonapi: song_review
    else
      render jsonapi_errors: song_review
    end
  end

  def destroy
    song_review = SongReviewResource.find(params)

    if song_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: song_review
    end
  end
end
