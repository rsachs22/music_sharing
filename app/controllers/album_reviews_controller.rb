class AlbumReviewsController < ApplicationController
  before_action :set_album_review, only: %i[show edit update destroy]

  def index
    @q = AlbumReview.ransack(params[:q])
    @album_reviews = @q.result(distinct: true).includes(:user, :album,
                                                        :artist).page(params[:page]).per(10)
  end

  def show; end

  def new
    @album_review = AlbumReview.new
  end

  def edit; end

  def create
    @album_review = AlbumReview.new(album_review_params)

    if @album_review.save
      message = "AlbumReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @album_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @album_review.update(album_review_params)
      redirect_to @album_review,
                  notice: "Album review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @album_review.destroy
    message = "AlbumReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to album_reviews_url, notice: message
    end
  end

  private

  def set_album_review
    @album_review = AlbumReview.find(params[:id])
  end

  def album_review_params
    params.require(:album_review).permit(:user_id, :body, :title, :stars,
                                         :album_id)
  end
end
