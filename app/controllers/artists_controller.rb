class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(:distinct => true).includes(:albums, :songs, :album_reviews).page(params[:page]).per(10)
  end

  # GET /artists/1
  def show
    @song = Song.new
    @album = Album.new
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
    redirect_to artists_url, notice: 'Artist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:artist_image, :artist_bio)
    end
end
