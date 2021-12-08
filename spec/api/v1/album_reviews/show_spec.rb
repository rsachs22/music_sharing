require "rails_helper"

RSpec.describe "album_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/album_reviews/#{album_review.id}", params: params
  end

  describe "basic fetch" do
    let!(:album_review) { create(:album_review) }

    it "works" do
      expect(AlbumReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("album_reviews")
      expect(d.id).to eq(album_review.id)
    end
  end
end
