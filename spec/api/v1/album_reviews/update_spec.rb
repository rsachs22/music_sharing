require 'rails_helper'

RSpec.describe "album_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/album_reviews/#{album_review.id}", payload
  end

  describe 'basic update' do
    let!(:album_review) { create(:album_review) }

    let(:payload) do
      {
        data: {
          id: album_review.id.to_s,
          type: 'album_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AlbumReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { album_review.reload.attributes }
    end
  end
end
