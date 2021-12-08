require 'rails_helper'

RSpec.describe "genres#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/genres", params: params
  end

  describe 'basic fetch' do
    let!(:genre1) { create(:genre) }
    let!(:genre2) { create(:genre) }

    it 'works' do
      expect(GenreResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['genres'])
      expect(d.map(&:id)).to match_array([genre1.id, genre2.id])
    end
  end
end
