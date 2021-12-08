require "rails_helper"

RSpec.describe "song_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/song_reviews/#{song_review.id}"
  end

  describe "basic destroy" do
    let!(:song_review) { create(:song_review) }

    it "updates the resource" do
      expect(SongReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SongReview.count }.by(-1)
      expect { song_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
