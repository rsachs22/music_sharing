require "rails_helper"

RSpec.describe "song_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/song_reviews/#{song_review.id}", params: params
  end

  describe "basic fetch" do
    let!(:song_review) { create(:song_review) }

    it "works" do
      expect(SongReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("song_reviews")
      expect(d.id).to eq(song_review.id)
    end
  end
end
