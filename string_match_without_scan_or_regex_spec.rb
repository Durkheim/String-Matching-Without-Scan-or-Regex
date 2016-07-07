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
      #a test against false positives
      expect(String.method_defined?(:matchez?)).to be(false)
    end

    it 'expects a single argument' do
      expect(string.method(:match?).arity).to eq(1)
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
      #a test against false positives
      expect(String.method_defined?(:match_countz)).to be(false)
    end

    it 'expects a single argument' do
      expect(string.method(:match_count).arity).to eq(1)
    end

    it 'should return an integer for the number of matches' do
      expect(string.match_count(substring)).to be_kind_of(Integer)
      expect(string.match_count(substring)).to eq(2)
      expect(string.match_count(substring_two)).to be_kind_of(Integer)
      expect(string.match_count(substring_two)).to eq(0)
    end

  end

end