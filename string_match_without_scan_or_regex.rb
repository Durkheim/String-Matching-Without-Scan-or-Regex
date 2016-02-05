def match?(string, substring)
  string_array = string.split("")
  substring_array = substring.split("")
  character_matches = []
  substring_array.each_with_index do |substring_character, substring_index|
    check_for_character_match(string_array, substring_array, substring_character, substring_index, character_matches)
  end
  puts character_matches
  character_matches.join("") == substring ? true : false
end

def check_for_character_match(string_array, substring_array, substring_character, substring_index, character_matches)
  if substring_index == 0 && string_array.include?(substring_character)
    character_matches.push(substring_character)
  elsif substring_index > 0 && string_array.include?(substring_character)
    string_array.each_with_index do |string_character, string_index|
      if string_character == substring_character && string_array[string_index - 1] == substring_array[substring_index - 1]
        character_matches.push(substring_character)
        break
      end
    end
  end
end

p match?("likes", "like") == true
p match?("muchlikes", "like") == true
p match?("ikelmuchlikes", "like") == true
p match?("bass1lurv", " 1lurv") == false
p match?("1basslurv", "1lurv") == false