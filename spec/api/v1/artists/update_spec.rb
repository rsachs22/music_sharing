require 'rails_helper'

RSpec.describe "artists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/artists/#{artist.id}", payload
  end

  describe 'basic update' do
    let!(:artist) { create(:artist) }

    let(:payload) do
      {
        data: {
          id: artist.id.to_s,
          type: 'artists',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ArtistResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { artist.reload.attributes }
    end
  end
end
