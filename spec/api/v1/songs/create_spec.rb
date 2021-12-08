require 'rails_helper'

RSpec.describe "songs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/songs", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'songs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SongResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Song.count }.by(1)
    end
  end
end
