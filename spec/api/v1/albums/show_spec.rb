require "rails_helper"

RSpec.describe "albums#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/albums/#{album.id}", params: params
  end

  describe "basic fetch" do
    let!(:album) { create(:album) }

    it "works" do
      expect(AlbumResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("albums")
      expect(d.id).to eq(album.id)
    end
  end
end
