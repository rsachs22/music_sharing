require 'rails_helper'

RSpec.describe "genres#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/genres/#{genre.id}"
  end

  describe 'basic destroy' do
    let!(:genre) { create(:genre) }

    it 'updates the resource' do
      expect(GenreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Genre.count }.by(-1)
      expect { genre.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
