class String

  def match?(substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(self, substring, {}, 0)
      matches.has_value?(substring)
    else
      wrong_argument_type
    end
  end

  def match_count(substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(self, substring, {}, 0)
      matches.length
    else
      wrong_argument_type
    end
  end

  def match_indices(substring)
    if substring.class == String
      #passing hash to collect matches, as well as the starting
      #index 0 for the recursive call
      matches = generate_matches(self, substring, {}, 0)
      matches.keys
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
  def generate_matches(string, substring, collection_of_matches, match_index)

    string_slice = string.slice(0, substring.length)

    collection_of_matches[match_index] = string_slice if string_slice == substring

    if string.length > 1
      match_index += 1
      next_string_section = string.split('')
      next_string_section.shift
      next_string_section = next_string_section.join('')
      generate_matches(next_string_section, substring, collection_of_matches, match_index)
    else
      collection_of_matches
    end

  end

end
