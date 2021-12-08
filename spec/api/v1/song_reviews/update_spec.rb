require 'rails_helper'

RSpec.describe "song_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/song_reviews/#{song_review.id}", payload
  end

  describe 'basic update' do
    let!(:song_review) { create(:song_review) }

    let(:payload) do
      {
        data: {
          id: song_review.id.to_s,
          type: 'song_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SongReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { song_review.reload.attributes }
    end
  end
end
