require 'rails_helper'

RSpec.describe AlbumResource, type: :resource do
  describe 'serialization' do
    let!(:album) { create(:album) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(album.id)
      expect(data.jsonapi_type).to eq('albums')
    end
  end

  describe 'filtering' do
    let!(:album1) { create(:album) }
    let!(:album2) { create(:album) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: album2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([album2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:album1) { create(:album) }
      let!(:album2) { create(:album) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            album1.id,
            album2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            album2.id,
            album1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
