require 'rails_helper'

RSpec.describe Song, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:album) }

    it { should have_many(:song_reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
