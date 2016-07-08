class Matcher

  def match?(candidate, target)

    candidate_string = candidate.to_s
    target_string = target.to_s

    matches = generate_matches(candidate_string, target_string, [])
    matches.include?(target_string)
  end

  def match_count(candidate, target)

    candidate_string = candidate.to_s
    target_string = target.to_s

    matches = generate_matches(candidate_string, target_string, [])
    matches.count(target_string)
  end

  def match_indices(candidate, target)

    candidate_string = candidate.to_s
    target_string = target.to_s

    matches = generate_matches(candidate_string, target_string, [])
    matches.each_index.select{|index| matches[index] == target_string}
  end

  private

  #for first pass, collection_of_matches should be []
  def generate_matches(candidate_string, target_string, collection_of_matches)

    candidate_string.start_with?(target_string) ? collection_of_matches.push(target_string) : collection_of_matches.push(nil)
    return collection_of_matches if candidate_string.empty?
    next_string_section = candidate_string.slice(1, candidate_string.length)
    generate_matches(next_string_section, target_string, collection_of_matches)

  end

end
