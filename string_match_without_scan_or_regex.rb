class Matcher
  class << self
    def match?(candidate, target)

      matches = generate_matches(candidate, target, [])
      matches.include?(target.to_s)
    end

    def match_count(candidate, target)
      matches = generate_matches(candidate, target, [])
      matches.count(target.to_s)
    end

    #only returns indices for strings
    def match_indices_for_strings(candidate, target)
      matches = generate_matches(candidate, target, [])
      matches.each_index.select{|index| matches[index] == target}
    end

    private

    #for first pass, collection_of_matches should be []
    def generate_matches(candidate, target, collection_of_matches)
      candidate_string = candidate.to_s
      target_string = target.to_s
      candidate_string.start_with?(target_string) ? collection_of_matches.push(target_string) : collection_of_matches.push(nil)
      return collection_of_matches if candidate_string.empty?
      next_string_section = candidate_string.slice(1, candidate_string.length)
      generate_matches(next_string_section, target_string, collection_of_matches)
    end
  end
end
