class StringMatcher
  class << self

    def recursive_match?(candidate, target)
      candidate_string = candidate.to_s
      target_string = target.to_s
      matches = generate_matches_recursively(candidate_string, target_string, [])
      matches.include?(target_string)
    end

    def iterative_match?(candidate, target)
      candidate_string = candidate.to_s
      target_string = target.to_s
      matches = generate_matches_iteratively(candidate_string, target_string)
      matches.include?(target_string)
    end

    private

    #for first pass, collection_of_matches should be []
    def generate_matches_recursively(candidate, target, collection_of_matches)
      candidate.start_with?(target) ? collection_of_matches.push(target) : collection_of_matches.push(nil)
      return collection_of_matches if candidate.empty?
      next_section = candidate.slice(1, candidate.length)
      generate_matches_recursively(next_section, target, collection_of_matches)
    end

    def generate_matches_iteratively(candidate, target)
      candidate.split("").each_index.map do |index|
        target if candidate.slice(index, target.length).start_with?(target)
      end
    end

  end
end
