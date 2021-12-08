require "rails_helper"

RSpec.describe AlbumReview, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:album) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:artist) }
  end

  describe "Validations" do
  end
end
