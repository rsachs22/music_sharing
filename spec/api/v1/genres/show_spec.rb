require "rails_helper"

RSpec.describe "genres#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/genres/#{genre.id}", params: params
  end

  describe "basic fetch" do
    let!(:genre) { create(:genre) }

    it "works" do
      expect(GenreResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("genres")
      expect(d.id).to eq(genre.id)
    end
  end
end
