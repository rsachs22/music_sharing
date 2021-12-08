require 'rails_helper'

RSpec.describe GenreResource, type: :resource do
  describe 'serialization' do
    let!(:genre) { create(:genre) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(genre.id)
      expect(data.jsonapi_type).to eq('genres')
    end
  end

  describe 'filtering' do
    let!(:genre1) { create(:genre) }
    let!(:genre2) { create(:genre) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: genre2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([genre2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:genre1) { create(:genre) }
      let!(:genre2) { create(:genre) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            genre1.id,
            genre2.id
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
            genre2.id,
            genre1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
