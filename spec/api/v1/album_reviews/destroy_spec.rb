require "rails_helper"

RSpec.describe "album_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/album_reviews/#{album_review.id}"
  end

  describe "basic destroy" do
    let!(:album_review) { create(:album_review) }

    it "updates the resource" do
      expect(AlbumReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { AlbumReview.count }.by(-1)
      expect { album_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
