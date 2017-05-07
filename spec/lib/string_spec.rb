require "spec_helper"
require "string"

describe String do
  describe "#convert_to_array" do
    it "will take user input and turn it into an array of numbers" do
      input = "1, 2, 3"
      expect(input.convert_to_array).to eq([1, 2, 3])
    end
  end
end
