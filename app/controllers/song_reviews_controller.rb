class SongReviewsController < ApplicationController
  before_action :current_user_must_be_song_review_user,
                only: %i[edit update destroy]

  before_action :set_song_review, only: %i[show edit update destroy]

  # GET /song_reviews
  def index
    @q = SongReview.ransack(params[:q])
    @song_reviews = @q.result(distinct: true).includes(:user,
                                                       :song).page(params[:page]).per(10)
  end

  # GET /song_reviews/1
  def show; end

  # GET /song_reviews/new
  def new
    @song_review = SongReview.new
  end

  # GET /song_reviews/1/edit
  def edit; end

  # POST /song_reviews
  def create
    @song_review = SongReview.new(song_review_params)

    if @song_review.save
      message = "SongReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @song_review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /song_reviews/1
  def update
    if @song_review.update(song_review_params)
      redirect_to @song_review, notice: "Song review was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /song_reviews/1
  def destroy
    @song_review.destroy
    message = "SongReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to song_reviews_url, notice: message
    end
  end

  private

  def current_user_must_be_song_review_user
    set_song_review
    unless current_user == @song_review.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_song_review
    @song_review = SongReview.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def song_review_params
    params.require(:song_review).permit(:user_id, :body, :title, :stars,
                                        :song_id)
  end
end
