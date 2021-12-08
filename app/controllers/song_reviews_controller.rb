class SongReviewsController < ApplicationController
  before_action :set_song_review, only: [:show, :edit, :update, :destroy]

  # GET /song_reviews
  def index
    @song_reviews = SongReview.all
  end

  # GET /song_reviews/1
  def show
  end

  # GET /song_reviews/new
  def new
    @song_review = SongReview.new
  end

  # GET /song_reviews/1/edit
  def edit
  end

  # POST /song_reviews
  def create
    @song_review = SongReview.new(song_review_params)

    if @song_review.save
      redirect_to @song_review, notice: 'Song review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /song_reviews/1
  def update
    if @song_review.update(song_review_params)
      redirect_to @song_review, notice: 'Song review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /song_reviews/1
  def destroy
    @song_review.destroy
    redirect_to song_reviews_url, notice: 'Song review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_review
      @song_review = SongReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_review_params
      params.require(:song_review).permit(:user_id, :body, :title, :stars, :song_id)
    end
end
