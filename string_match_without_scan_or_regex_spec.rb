require_relative 'string_match_without_scan_or_regex'

describe Matcher do

  let(:randomly_generated_strings){ (0..2).map{(0..rand(1..100)).map{(rand(127)).chr}.join}}
  let(:candidate_string){ randomly_generated_strings[0] + "like" + randomly_generated_strings[1] + "like" + randomly_generated_strings[2]}
  let(:target_string_with_match){"like"}
  let(:target_string_with_no_match){"nope"}

  let(:candidate_array){(rand(0..49)..rand(50..100)).map{|x|x}.push([[1,3], (rand(0..49)..rand(50..100)).map{|x|x}])}
  let(:target_array_with_match){[1,3]}
  let(:target_array_with_no_match){[]}

  let(:candidate_hash){{a: 1, b: 2, c: {a: 1, b: 2}}}
  let(:target_hash_with_match){{a: 1, b: 2}}
  let(:target_hash_with_no_match){{}}

  let(:candidate_integer){(rand(0..100).to_s + 5.to_s + rand(0..100).to_s).to_i }
  let(:target_integer_with_match){5}
  let(:target_integer_with_no_match){999999999999999999999999999999}



  #Testing #match? functionality for objects
  describe '#match?' do

    it 'should return true when a match is found' do
      expect(Matcher.match?(candidate_string, target_string_with_match)).to be(true)
      expect(Matcher.match?(candidate_array, target_array_with_match)).to be(true)
      expect(Matcher.match?(candidate_hash, target_hash_with_match)).to be(true)
      expect(Matcher.match?(candidate_integer, target_integer_with_match)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(Matcher.match?(candidate_string, target_string_with_no_match)).to be(false)
      expect(Matcher.match?(candidate_array, target_array_with_no_match)).to be(false)
      expect(Matcher.match?(candidate_hash, target_hash_with_no_match)).to be(false)
      expect(Matcher.match?(candidate_integer, target_integer_with_no_match)).to be(false)
    end

  end


  #Testing #match_count functionality for objects
  describe '#match_count' do

    it 'should return an integer for the number of matches' do

        #string comparisons
        expect(Matcher.match_count(candidate_string, target_string_with_match)).to be_kind_of(Integer)
        expect(Matcher.match_count(candidate_string, target_string_with_match)).to eq(2)
        expect(Matcher.match_count(candidate_string, target_string_with_no_match)).to be_kind_of(Integer)
        expect(Matcher.match_count(candidate_string, target_string_with_no_match)).to eq(0)

        #array comparisons
        expect(Matcher.match_count(candidate_array, target_array_with_match)).to be_kind_of(Integer)
        expect(Matcher.match_count(candidate_array, target_array_with_match)).to eq(1)
        expect(Matcher.match_count(candidate_array, target_array_with_no_match)).to eq(0)

        #hash comparisons

        expect(Matcher.match_count(candidate_hash, target_hash_with_match)).to be_kind_of(Integer)
        expect(Matcher.match_count(candidate_hash, target_hash_with_match)).to eq(1)
        expect(Matcher.match_count(candidate_hash, target_hash_with_no_match)).to eq(0)

        #integer comparisons
        expect(Matcher.match_count(candidate_integer, target_integer_with_no_match)).to be_kind_of(Integer)
        expect(Matcher.match_count(candidate_integer, target_integer_with_match)).to be > 0
        expect(Matcher.match_count(candidate_integer, target_integer_with_no_match)).to eq(0)

    end

  end


  #Testing #match_indices functionality for objects of the class String
  describe '#match_indices_for_strings' do

    let(:new_candidate_string){"muchlikeslike"}
    let(:new_target_string_with_match){"like"}

    it 'should return an array of integers if there is at least one match' do

      #string comparisons
      expect(Matcher.match_indices_for_strings(candidate_string, target_string_with_match)).to be_kind_of(Array)
      #using new_string and new_substring to easily verify position
      expect(Matcher.match_indices_for_strings(new_candidate_string, new_target_string_with_match)).to eq([4,9])
      expect(Matcher.match_indices_for_strings(candidate_string, target_string_with_no_match)).to be_kind_of(Array)
      expect(Matcher.match_indices_for_strings(candidate_string, target_string_with_no_match)).to eq([])

    end

  end

end