require "rails_helper"

RSpec.describe AlbumReviewResource, type: :resource do
  describe "serialization" do
    let!(:album_review) { create(:album_review) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(album_review.id)
      expect(data.jsonapi_type).to eq("album_reviews")
    end
  end

  describe "filtering" do
    let!(:album_review1) { create(:album_review) }
    let!(:album_review2) { create(:album_review) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: album_review2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([album_review2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:album_review1) { create(:album_review) }
      let!(:album_review2) { create(:album_review) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      album_review1.id,
                                      album_review2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      album_review2.id,
                                      album_review1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
