require_relative 'string_match_without_scan_or_regex'

describe Matcher do

  let(:matcher){Matcher.new}

  let(:randomly_generated_strings){ (0..2).map{(0..rand(1..100)).map{(rand(127)).chr}.join}}
  let(:string){ randomly_generated_strings[0] + "like" + randomly_generated_strings[1] + "like" + randomly_generated_strings[2]}
  let(:substring_with_match){"like"}
  let(:substring_with_no_match){"nope"}


  #Testing #match? functionality for objects of the class String
  describe '#match?' do

    it 'should be a defined method on the class String' do
      expect(String.method_defined?(:match?)).to be(true)
      #a test against false positives for defined methods
      expect(String.method_defined?(:matchez?)).to be(false)
    end

    it 'should return true when a match is found' do
      expect(string.match?(substring_with_match)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(string.match?(substring_with_no_match)).to be(false)
    end

  end


  #Testing #match_count functionality for objects of the class String
  describe '#match_count' do

    it 'should be a defined method on the class String' do
      expect(String.method_defined?(:match_count)).to be(true)
      #a test against false positives for defined methods
      expect(String.method_defined?(:match_countz)).to be(false)
    end

    it 'should return an integer for the number of matches' do
      expect(string.match_count(substring_with_match)).to be_kind_of(Integer)
      expect(string.match_count(substring_with_match)).to eq(2)
      expect(string.match_count(substring_with_no_match)).to be_kind_of(Integer)
      expect(string.match_count(substring_with_no_match)).to eq(0)
    end

  end


  #Testing #match_indices functionality for objects of the class String
  describe '#match_indices' do
    let(:new_string){"muchlikeslike"}
    let(:new_substring_with_match){"like"}

    it 'should be a defined method on the class String' do
      expect(String.method_defined?(:match_indices)).to be(true)
      #a test against false positives for defined methods
      expect(String.method_defined?(:match_indicez)).to be(false)
    end

    it 'should return an array of integers indicating indices of a match' do
      expect(string.match_indices(substring_with_match)).to be_kind_of(Array)
      #using new_string and new_substring to easily verify position
      expect(new_string.match_indices(new_substring_with_match)).to eq([4,9])
      expect(string.match_indices(substring_with_no_match)).to be_kind_of(Array)
      expect(string.match_indices(substring_with_no_match)).to eq([])
    end

  end

end