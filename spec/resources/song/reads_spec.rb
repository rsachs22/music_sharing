require "rails_helper"

RSpec.describe SongResource, type: :resource do
  describe "serialization" do
    let!(:song) { create(:song) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(song.id)
      expect(data.jsonapi_type).to eq("songs")
    end
  end

  describe "filtering" do
    let!(:song1) { create(:song) }
    let!(:song2) { create(:song) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: song2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([song2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:song1) { create(:song) }
      let!(:song2) { create(:song) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      song1.id,
                                      song2.id,
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
                                      song2.id,
                                      song1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
