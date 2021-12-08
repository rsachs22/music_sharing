require 'rails_helper'

RSpec.describe "song_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/song_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:song_review1) { create(:song_review) }
    let!(:song_review2) { create(:song_review) }

    it 'works' do
      expect(SongReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['song_reviews'])
      expect(d.map(&:id)).to match_array([song_review1.id, song_review2.id])
    end
  end
end
