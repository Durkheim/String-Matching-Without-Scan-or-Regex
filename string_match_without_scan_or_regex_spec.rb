require_relative 'string_match_without_scan_or_regex'

describe Matcher do

  let(:matcher){Matcher.new}


  let(:randomly_generated_strings){ (0..2).map{(0..rand(1..100)).map{(rand(127)).chr}.join}}
  let(:candidate_string){ randomly_generated_strings[0] + "like" + randomly_generated_strings[1] + "like" + randomly_generated_strings[2]}
  let(:target_string_with_match){"like"}
  let(:target_string_with_no_match){"nope"}

  let(:candidate_array){[[1,3], 1]}
  let(:target_array_with_match){[1,3]}
  let(:target_array_with_no_match){[]}

  let(:candidate_hash){{a: 1, b: 2}}
  let(:target_hash_with_match){{a: 1, b: 2}}
  let(:target_hash_with_no_match){{}}


  #Testing #match? functionality for objects of the class String
  describe '#match?' do

    it 'should return true when a match is found' do
      expect(matcher.match?(candidate_string, target_string_with_match)).to be(true)
      expect(matcher.match?(candidate_array, target_array_with_match)).to be(true)
      expect(matcher.match?(candidate_hash, target_hash_with_match)).to be(true)
    end

    it 'should return false when a match is not found' do
      expect(matcher.match?(candidate_string, target_string_with_no_match)).to be(false)
      expect(matcher.match?(candidate_array, target_array_with_no_match)).to be(false)
      expect(matcher.match?(candidate_hash, target_hash_with_no_match)).to be(false)


    end

  end


  #Testing #match_count functionality for objects of the class String
  describe '#match_count' do

    it 'should return an integer for the number of matches' do
      expect(matcher.match_count(candidate_string, target_string_with_match)).to be_kind_of(Integer)
      expect(matcher.match_count(candidate_string, target_string_with_match)).to eq(2)
      expect(matcher.match_count(candidate_string, target_string_with_no_match)).to be_kind_of(Integer)
      expect(matcher.match_count(candidate_string, target_string_with_no_match)).to eq(0)
    end

  end


  #Testing #match_indices functionality for objects of the class String
  describe '#match_indices' do
    let(:new_candidate_string){"muchlikeslike"}
    let(:new_target_string_with_match){"like"}

    it 'should return an array of integers if there is at least one match' do
      expect(matcher.match_indices(candidate_string, target_string_with_match)).to be_kind_of(Array)
      #using new_string and new_substring to easily verify position
      expect(matcher.match_indices(new_candidate_string, new_target_string_with_match)).to eq([4,9])
      expect(matcher.match_indices(candidate_string, target_string_with_no_match)).to be_kind_of(Array)
      expect(matcher.match_indices(candidate_string, target_string_with_no_match)).to eq([])
    end

  end

end