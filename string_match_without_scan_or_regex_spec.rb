require_relative 'string_match_without_scan_or_regex'

describe String do

  let(:randomly_generated_strings){ (0..2).map{(0..rand(1..100)).map{(rand(127)).chr}.join}}
  let(:string){ randomly_generated_strings[0] + "like" + randomly_generated_strings[1] + "like" + randomly_generated_strings[2]}
  let(:substring){"like"}
  let(:substring_two){"nope"}

  describe 'string variables' do
    describe 'string' do
      it 'should be an object of the class String' do
        expect(string).to be_kind_of(String)
      end
    end

    describe 'substring' do
      it 'should be an object of the class String' do
        expect(substring).to be_kind_of(String)
      end
    end

    describe 'substring_two' do
      it 'should be an object of the class String' do
        expect(substring_two).to be_kind_of(String)
      end
    end
  end


  describe '#match?' do

    it 'should be a defined method on the class String' do
      expect(String.method_defined?(:match?)).to be(true)
      #a test against false positives for defined methods
      expect(String.method_defined?(:matchez?)).to be(false)
    end

    it 'will raise an error if called on an instance that is not a String object' do
      expect{[].match?(string)}.to raise_error(NoMethodError)
      expect{1.match?(string)}.to raise_error(NoMethodError)
      expect{{}.match?(string)}.to raise_error(NoMethodError)
    end

    it 'expects a single argument' do
      expect(string.method(:match?).arity).to eq(1)
      expect{string.match?(string, substring)}.to raise_error(ArgumentError)
    end

    it 'expects a string as an argument' do
      expect{string.match?([])}.to raise_error('wrong argument type (expected String)')
      expect{string.match_count(1)}.to raise_error('wrong argument type (expected String)')
      expect{string.match_count({})}.to raise_error('wrong argument type (expected String)')
    end

    it 'should return true when a match is found' do
      expect(string.match?(substring)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(string.match?(substring_two)).to be(false)
    end

  end


  describe '#match_count' do

    it 'should be a defined method on the class String' do
      expect(String.method_defined?(:match_count)).to be(true)
      #a test against false positives for defined methods
      expect(String.method_defined?(:match_countz)).to be(false)
    end

    it 'will raise an error if called on an instance that is not a String object' do
      expect{[].match_count(substring)}.to raise_error(NoMethodError)
      expect{1.match_count(substring)}.to raise_error(NoMethodError)
      expect{{}.match_count(substring)}.to raise_error(NoMethodError)
    end

    it 'expects a single argument' do
      expect(string.method(:match_count).arity).to eq(1)
      expect{string.match?(string, substring)}.to raise_error(ArgumentError)
    end

    it 'expects a string as an argument' do
      expect{string.match_count([])}.to raise_error('wrong argument type (expected String)')
      expect{string.match_count(1)}.to raise_error('wrong argument type (expected String)')
      expect{string.match_count({})}.to raise_error('wrong argument type (expected String)')
    end

    it 'should return an integer for the number of matches' do
      expect(string.match_count(substring)).to be_kind_of(Integer)
      expect(string.match_count(substring)).to eq(2)
      expect(string.match_count(substring_two)).to be_kind_of(Integer)
      expect(string.match_count(substring_two)).to eq(0)
    end

  end

end