require "rails_helper"

RSpec.describe ArtistResource, type: :resource do
  describe "serialization" do
    let!(:artist) { create(:artist) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(artist.id)
      expect(data.jsonapi_type).to eq("artists")
    end
  end

  describe "filtering" do
    let!(:artist1) { create(:artist) }
    let!(:artist2) { create(:artist) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: artist2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([artist2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:artist1) { create(:artist) }
      let!(:artist2) { create(:artist) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      artist1.id,
                                      artist2.id,
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
                                      artist2.id,
                                      artist1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
