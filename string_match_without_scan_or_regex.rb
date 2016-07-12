class Matcher
  class << self

    def recursive_match?(candidate, target)
      matches = generate_matches_recursive(candidate, target, [])
      matches.include?(target.to_s)
    end

    def iterative_match?(candidate, target)
      matches = generate_matches_iterative(candidate, target)
      matches.include?(target.to_s)
    end

    private

    #for first pass, collection_of_matches should be []
    def generate_matches_recursive(candidate, target, collection_of_matches)
      candidate_string = candidate.to_s
      target_string = target.to_s
      candidate_string.start_with?(target_string) ? collection_of_matches.push(target_string) : collection_of_matches.push(nil)
      return collection_of_matches if candidate_string.empty?
      next_string_section = candidate_string.slice(1, candidate_string.length)
      generate_matches_recursive(next_string_section, target_string, collection_of_matches)
    end

    def generate_matches_iterative(candidate, target)
      candidate_string = candidate.to_s
      target_string = target.to_s
      candidate_string.split("").each_index.map do |index|
        target_string if candidate_string.slice(index, target_string.length).start_with?(target_string)
      end
    end

  end
end
