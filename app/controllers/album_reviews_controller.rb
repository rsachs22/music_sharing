class AlbumReviewsController < ApplicationController
  before_action :set_album_review, only: [:show, :edit, :update, :destroy]

  # GET /album_reviews
  def index
    @album_reviews = AlbumReview.all
  end

  # GET /album_reviews/1
  def show
  end

  # GET /album_reviews/new
  def new
    @album_review = AlbumReview.new
  end

  # GET /album_reviews/1/edit
  def edit
  end

  # POST /album_reviews
  def create
    @album_review = AlbumReview.new(album_review_params)

    if @album_review.save
      redirect_to @album_review, notice: 'Album review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_reviews/1
  def update
    if @album_review.update(album_review_params)
      redirect_to @album_review, notice: 'Album review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_reviews/1
  def destroy
    @album_review.destroy
    message = "AlbumReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to album_reviews_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_review
      @album_review = AlbumReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_review_params
      params.require(:album_review).permit(:user_id, :body, :title, :stars, :album_id)
    end
end
