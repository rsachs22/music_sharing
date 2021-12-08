require "rails_helper"

RSpec.describe "albums#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/albums/#{album.id}", payload
  end

  describe "basic update" do
    let!(:album) { create(:album) }

    let(:payload) do
      {
        data: {
          id: album.id.to_s,
          type: "albums",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AlbumResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { album.reload.attributes }
    end
  end
end
