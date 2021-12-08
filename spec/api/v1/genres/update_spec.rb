require 'rails_helper'

RSpec.describe "genres#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/genres/#{genre.id}", payload
  end

  describe 'basic update' do
    let!(:genre) { create(:genre) }

    let(:payload) do
      {
        data: {
          id: genre.id.to_s,
          type: 'genres',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GenreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { genre.reload.attributes }
    end
  end
end
