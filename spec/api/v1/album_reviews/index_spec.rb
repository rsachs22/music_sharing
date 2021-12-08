require 'rails_helper'

RSpec.describe "album_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/album_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:album_review1) { create(:album_review) }
    let!(:album_review2) { create(:album_review) }

    it 'works' do
      expect(AlbumReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['album_reviews'])
      expect(d.map(&:id)).to match_array([album_review1.id, album_review2.id])
    end
  end
end
