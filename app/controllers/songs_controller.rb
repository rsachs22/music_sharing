class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  def index
    @q = Song.ransack(params[:q])
    @songs = @q.result(:distinct => true).includes(:song_reviews, :album, :artist, :genre).page(params[:page]).per(10)
  end

  # GET /songs/1
  def show
    @song_review = SongReview.new
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      message = 'Song was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @song, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      redirect_to @song, notice: 'Song was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
    message = "Song was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to songs_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:name, :album_id, :artist_id)
    end
end
