require 'rails_helper'

RSpec.describe "songs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/songs/#{song.id}", payload
  end

  describe 'basic update' do
    let!(:song) { create(:song) }

    let(:payload) do
      {
        data: {
          id: song.id.to_s,
          type: 'songs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SongResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { song.reload.attributes }
    end
  end
end
