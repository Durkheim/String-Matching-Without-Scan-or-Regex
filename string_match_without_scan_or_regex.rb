class StringMatcher

  def match?(string, substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(string, substring, [])
      matches.include?(substring)
    else
      wrong_argument_type
    end
  end

  def match_count(string, substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(string, substring, [])
      matches.count(substring)
    else
      wrong_argument_type
    end
  end

  def match_indices(string, substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(string, substring, [])
      matches.each_index.select{|index| matches[index] == substring}
    else
      wrong_argument_type
    end
  end

  private

  #used as a constant for wrong argument type
  def wrong_argument_type
    raise 'wrong argument type (expected String)'
  end


  #for first pass, collection_of_matches should be {} and match_index should be 0
  def generate_matches(string, substring, collection_of_matches)

    string.start_with?(substring) ? collection_of_matches.push(substring) : collection_of_matches.push(nil)
    return collection_of_matches if string.empty?
    next_string_section = string.slice(1, string.length)
    generate_matches(next_string_section, substring, collection_of_matches)

  end

end
