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
    subject do
      StringCompressor.new("abcd")
    end

    it "doesn't return the count for characters that don't repeat" do
      expect(subject.compress).to eql("abcd")
    end
  end

  context "given a longest string" do
    subject do
      StringCompressor.new("aabbbccc")
    end

    it "returns each character followed by their count" do
      expect(subject.compress).to eql("a2b3c3")
    end
  end

  context "given a non string value" do
    subject do
      StringCompressor.new(1)
    end

    it "raises an 'NonString' exception" do
      expect { raise subject.compress }.to raise_error("Non string received, please inform a string")
    end
  end
end
