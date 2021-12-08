require "rails_helper"

RSpec.describe AlbumResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "albums",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AlbumResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Album.count }.by(1)
    end
  end

  describe "updating" do
    let!(:album) { create(:album) }

    let(:payload) do
      {
        data: {
          id: album.id.to_s,
          type: "albums",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AlbumResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { album.reload.updated_at }
      # .and change { album.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:album) { create(:album) }

    let(:instance) do
      AlbumResource.find(id: album.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Album.count }.by(-1)
    end
  end
end
