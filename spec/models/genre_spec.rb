require 'rails_helper'

RSpec.describe Genre, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:albums) }

    end

    describe "InDirect Associations" do

    it { should have_many(:songs) }

    end

    describe "Validations" do

    end
end
