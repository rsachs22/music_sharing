require "rails_helper"

RSpec.describe SongResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "songs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SongResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Song.count }.by(1)
    end
  end

  describe "updating" do
    let!(:song) { create(:song) }

    let(:payload) do
      {
        data: {
          id: song.id.to_s,
          type: "songs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SongResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { song.reload.updated_at }
      # .and change { song.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:song) { create(:song) }

    let(:instance) do
      SongResource.find(id: song.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Song.count }.by(-1)
    end
  end
end
