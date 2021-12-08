require 'rails_helper'

RSpec.describe "album_reviews#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/album_reviews", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'album_reviews',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AlbumReviewResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AlbumReview.count }.by(1)
    end
  end
end
