require 'rails_helper'

RSpec.describe GenreResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'genres',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GenreResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Genre.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:genre) { create(:genre) }

    let(:payload) do
      {
        data: {
          id: genre.id.to_s,
          type: 'genres',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GenreResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { genre.reload.updated_at }
      # .and change { genre.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:genre) { create(:genre) }

    let(:instance) do
      GenreResource.find(id: genre.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Genre.count }.by(-1)
    end
  end
end
