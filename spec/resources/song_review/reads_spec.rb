require "rails_helper"

RSpec.describe SongReviewResource, type: :resource do
  describe "serialization" do
    let!(:song_review) { create(:song_review) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(song_review.id)
      expect(data.jsonapi_type).to eq("song_reviews")
    end
  end

  describe "filtering" do
    let!(:song_review1) { create(:song_review) }
    let!(:song_review2) { create(:song_review) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: song_review2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([song_review2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:song_review1) { create(:song_review) }
      let!(:song_review2) { create(:song_review) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      song_review1.id,
                                      song_review2.id,
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
                                      song_review2.id,
                                      song_review1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
