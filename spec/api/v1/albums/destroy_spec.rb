require "rails_helper"

RSpec.describe "albums#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/albums/#{album.id}"
  end

  describe "basic destroy" do
    let!(:album) { create(:album) }

    it "updates the resource" do
      expect(AlbumResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Album.count }.by(-1)
      expect { album.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
