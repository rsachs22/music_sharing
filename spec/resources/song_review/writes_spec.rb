require 'rails_helper'

RSpec.describe SongReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'song_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SongReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SongReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:song_review) { create(:song_review) }

    let(:payload) do
      {
        data: {
          id: song_review.id.to_s,
          type: 'song_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SongReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { song_review.reload.updated_at }
      # .and change { song_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:song_review) { create(:song_review) }

    let(:instance) do
      SongReviewResource.find(id: song_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SongReview.count }.by(-1)
    end
  end
end