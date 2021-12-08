require "rails_helper"

RSpec.describe AlbumReviewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "album_reviews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AlbumReviewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { AlbumReview.count }.by(1)
    end
  end

  describe "updating" do
    let!(:album_review) { create(:album_review) }

    let(:payload) do
      {
        data: {
          id: album_review.id.to_s,
          type: "album_reviews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AlbumReviewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { album_review.reload.updated_at }
      # .and change { album_review.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:album_review) { create(:album_review) }

    let(:instance) do
      AlbumReviewResource.find(id: album_review.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { AlbumReview.count }.by(-1)
    end
  end
end
