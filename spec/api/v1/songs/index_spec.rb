require "rails_helper"

RSpec.describe "songs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/songs", params: params
  end

  describe "basic fetch" do
    let!(:song1) { create(:song) }
    let!(:song2) { create(:song) }

    it "works" do
      expect(SongResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["songs"])
      expect(d.map(&:id)).to match_array([song1.id, song2.id])
    end
  end
end
