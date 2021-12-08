require "rails_helper"

RSpec.describe "albums#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/albums", params: params
  end

  describe "basic fetch" do
    let!(:album1) { create(:album) }
    let!(:album2) { create(:album) }

    it "works" do
      expect(AlbumResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["albums"])
      expect(d.map(&:id)).to match_array([album1.id, album2.id])
    end
  end
end
