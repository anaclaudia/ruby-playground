require "string_compressor"

describe StringCompressor do
  context "given an empty string" do
    it "returns an empty string" do
      subject = StringCompressor.new("")

      expect(subject.compress).to eql("")
    end

    it "removes empty spaces" do
      subject = StringCompressor.new(" ")

      expect(subject.compress).to eql("")
    end

    it "has a length of zero" do
      subject = StringCompressor.new("")

      expect(subject.length).to eql(0)
    end
  end

  context "given a single character" do
    subject do
      StringCompressor.new("a")
    end

    it "returns a single character" do
      expect(subject.compress).to eql("a")
    end
  end

  context "given a string" do
    it "doesn't return the count for characters that don't repeat" do
      expect(StringCompressor.new("abcd").compress).to eql("abcd")
    end

    it "returns each character followed by their count" do
      expect(StringCompressor.new("aabbbccc").compress).to eql("a2b3c3")
    end
  end

  context "given a non string value" do
    it "returns an CompressorError message" do
    end
  end
end
