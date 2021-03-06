require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "Direct Associations" do
    it { should have_many(:songs) }

    it { should have_many(:albums) }
  end

  describe "InDirect Associations" do
    it { should have_many(:album_reviews) }
  end

  describe "Validations" do
  end
end
