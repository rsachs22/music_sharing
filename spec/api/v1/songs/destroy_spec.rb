require "rails_helper"

RSpec.describe "songs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/songs/#{song.id}"
  end

  describe "basic destroy" do
    let!(:song) { create(:song) }

    it "updates the resource" do
      expect(SongResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Song.count }.by(-1)
      expect { song.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
