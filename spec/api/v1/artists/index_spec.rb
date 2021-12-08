require 'rails_helper'

RSpec.describe "artists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artists", params: params
  end

  describe 'basic fetch' do
    let!(:artist1) { create(:artist) }
    let!(:artist2) { create(:artist) }

    it 'works' do
      expect(ArtistResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['artists'])
      expect(d.map(&:id)).to match_array([artist1.id, artist2.id])
    end
  end
end
