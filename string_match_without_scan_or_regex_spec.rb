require_relative 'string_match_without_scan_or_regex'

describe StringMatcher do

  let(:randomly_generated_strings){ (0..2).map{(0..rand(1..100)).map{(rand(127)).chr}.join}}

  let(:candidate_string){ randomly_generated_strings[0] + "like" + randomly_generated_strings[1] + "like" + randomly_generated_strings[2]}
  let(:large_candidate_string){(1..10000).map{(rand(127)).chr}.join + "like" + randomly_generated_strings[1] + "like"}

  let(:target_string_with_match){"like"}
  let(:target_string_with_no_match){"nope"}

  # let(:candidate_array){(rand(0..49)..rand(50..100)).map{|x|x}.push([[1,3], (rand(0..49)..rand(50..100)).map{|x|x}])}
  # let(:target_array_with_match){[1,3]}
  # let(:target_array_with_no_match){[]}
  #
  # let(:candidate_hash){{a: 1, b: 2, c: {a: 1, b: 2}}}
  # let(:target_hash_with_match){{a: 1, b: 2}}
  # let(:target_hash_with_no_match){{}}
  #
  # let(:candidate_integer){(rand(0..100).to_s + 5.to_s + rand(0..100).to_s).to_i }
  # let(:target_integer_with_match){5}
  # let(:target_integer_with_no_match){999999999999999999999999999999}



  #Testing #match? functionality for objects
  describe '#iterative_match?' do

    it 'should return true when a match is found' do
      expect(StringMatcher.iterative_match?(candidate_string, target_string_with_match)).to be(true)
      # expect(StringMatcher.iterative_match?(candidate_array, target_array_with_match)).to be(true)
      # expect(StringMatcher.iterative_match?(candidate_hash, target_hash_with_match)).to be(true)
      # expect(StringMatcher.iterative_match?(candidate_integer, target_integer_with_match)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(StringMatcher.recursive_match?(candidate_string, target_string_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_array, target_array_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_hash, target_hash_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_integer, target_integer_with_no_match)).to be(false)
    end

    it 'should successfully return a value for large candidate strings' do
      expect(StringMatcher.iterative_match?(large_candidate_string, target_string_with_match)).to be(true)
    end

  end

  describe '#recursive_match?' do

    it 'should return true when a match is found' do
      expect(StringMatcher.recursive_match?(candidate_string, target_string_with_match)).to be(true)
      # expect(StringMatcher.recursive_match?(candidate_array, target_array_with_match)).to be(true)
      # expect(StringMatcher.recursive_match?(candidate_hash, target_hash_with_match)).to be(true)
      # expect(StringMatcher.recursive_match?(candidate_integer, target_integer_with_match)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(StringMatcher.recursive_match?(candidate_string, target_string_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_array, target_array_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_hash, target_hash_with_no_match)).to be(false)
      # expect(StringMatcher.recursive_match?(candidate_integer, target_integer_with_no_match)).to be(false)
    end

    it 'should raise a system stack error when parsing large candidate strings' do

      expect{StringMatcher.recursive_match?(large_candidate_string, target_string_with_match)}.to raise_error(SystemStackError)

    end

  end




end