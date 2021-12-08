class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]

  def index
    @q = Song.ransack(params[:q])
    @songs = @q.result(distinct: true).includes(:song_reviews, :album,
                                                :artist, :genre).page(params[:page]).per(10)
  end

  def show
    @song_review = SongReview.new
  end

  def new
    @song = Song.new
  end

  def edit; end

  def create
    @song = Song.new(song_params)

    if @song.save
      message = "Song was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @song, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "Song was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    message = "Song was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to songs_url, notice: message
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :album_id, :artist_id)
  end
end
