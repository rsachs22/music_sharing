require 'rails_helper'

RSpec.describe ArtistResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'artists',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ArtistResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Artist.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:artist) { create(:artist) }

    let(:payload) do
      {
        data: {
          id: artist.id.to_s,
          type: 'artists',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ArtistResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { artist.reload.updated_at }
      # .and change { artist.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:artist) { create(:artist) }

    let(:instance) do
      ArtistResource.find(id: artist.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Artist.count }.by(-1)
    end
  end
end
