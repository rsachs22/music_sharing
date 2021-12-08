require "rails_helper"

RSpec.describe Album, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:genre) }

    it { should belong_to(:artist) }

    it { should have_many(:album_reviews) }

    it { should have_many(:songs) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
