require 'rails_helper'

RSpec.describe "artists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/artists/#{artist.id}"
  end

  describe 'basic destroy' do
    let!(:artist) { create(:artist) }

    it 'updates the resource' do
      expect(ArtistResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Artist.count }.by(-1)
      expect { artist.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
