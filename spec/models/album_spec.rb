require 'rails_helper'

RSpec.describe Album, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:songs) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
