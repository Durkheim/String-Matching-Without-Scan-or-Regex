def match?(string, substring)
  string_array = string.split("")
  substring_array = substring.split("")
  character_matches = []
  substring_array.each_with_index do |substring_character, substring_index|
    find_character_match(string_array, substring_array, substring_character, substring_index, character_matches)
  end
  character_matches.join("") == substring ? true : false
end

def find_character_match(string_array, substring_array, substring_character, substring_index, character_matches)
  if string_array.include?(substring_character)
    if substring_index == 0
      character_matches.push(substring_character)
    elsif substring_index > 0
      string_array.each_with_index do |string_character, string_index|

        characters_do_match = string_character == substring_character
        previous_string_index_not_negative = string_index - 1 > -1
        previous_characters_do_match = string_array[string_index - 1] == substring_array[substring_index - 1]

        if characters_do_match && previous_string_index_not_negative && previous_characters_do_match
          character_matches.push(substring_character)
          break
        end
      end
    end
  end
end

p match?("likes", "like") == true
p match?("muchlikes", "like") == true
p match?("ikelmuchlikes", "like") == true
p match?("bass1lurv", " 1lurv") == false
p match?("1basslurv", "1lurv") == false
p match?("ikemarl", "like") == false