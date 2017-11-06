require "spec_helper"
require "gameplay"

describe Gameplay do
  describe "#get_dimension" do
    it "will throw an error and reset if fed a non-number" do
    end
  end

  describe "#bad_characters?" do
    it "will throw an error if anything but spaces, commas, and numbers" do
    end
  end

  describe "#invalid_numbers?" do
    it "will throw an error if fed numbers that aren't in the grid" do
    end
  end

  describe "#nil_value_entered?" do
    it "will throw an error if no value was entered after a comma" do

    end
  end

  describe "#duplicates?" do
    it "will throw an error if duplicate values are entered" do

    end
  end
end
