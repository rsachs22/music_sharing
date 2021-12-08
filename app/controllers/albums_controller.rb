class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @q = Album.ransack(params[:q])
    @albums = @q.result(distinct: true).includes(:songs, :album_reviews,
                                                 :artist, :genre).page(params[:page]).per(10)
  end

  def show
    @album_review = AlbumReview.new
    @song = Song.new
  end

  def new
    @album = Album.new
  end

  def edit; end

  def create
    @album = Album.new(album_params)

    if @album.save
      message = "Album was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @album, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    message = "Album was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to albums_url, notice: message
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :album_art, :genre_id, :artist_id)
  end
end
