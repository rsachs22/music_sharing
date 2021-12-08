require 'rails_helper'

RSpec.describe "songs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/songs/#{song.id}", params: params
  end

  describe 'basic fetch' do
    let!(:song) { create(:song) }

    it 'works' do
      expect(SongResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('songs')
      expect(d.id).to eq(song.id)
    end
  end
end
