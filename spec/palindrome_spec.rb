require "palindrome"

describe Palindrome do
  context "given a empty string" do
    it "returns true" do
      subject = Palindrome.new("")
      expect(subject.palindrome?).to eql(true)
    end
  end

  context "given a string with a single character" do
    it "returns true" do
      subject = Palindrome.new("a")
      expect(subject.palindrome?).to eql(true)
    end
  end

  context "given a long string, which is a palindrome" do
    it "returns true" do
      subject = Palindrome.new("a but tuba")
      expect(subject.palindrome?).to eql(true)
    end
  end

  context "given a long string, which isn't a palindrome" do
    it "returns false" do
      subject = Palindrome.new("aabb")
      expect(subject.palindrome?).to eql(false)
    end
  end
end
