class String

  def match?(substring)
    matches = generate_matches(self, substring, [])
    matches.include?(substring)
  end

  def match_count(substring)
    matches = generate_matches(self, substring, [])
    matches.length
  end

  private

  def generate_matches(string, substring, collection_of_matches)

    string_slice = string.slice(0, substring.length)

    collection_of_matches.push(string_slice) if string_slice == substring

    if string.length > 1
      next_string_section = string.split('')
      next_string_section.shift
      next_string_section = next_string_section.join('')
      generate_matches(next_string_section, substring, collection_of_matches)
    else
      collection_of_matches
    end

  end

end
