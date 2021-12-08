require "rails_helper"

RSpec.describe "artists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artists/#{artist.id}", params: params
  end

  describe "basic fetch" do
    let!(:artist) { create(:artist) }

    it "works" do
      expect(ArtistResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("artists")
      expect(d.id).to eq(artist.id)
    end
  end
end
