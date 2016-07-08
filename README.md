# String Matching Without Scan or Regex

### Objective

Without using :scan or RegEx perform the following:

- write a :match? method that returns true or false if a substring is found within a string
- write a :match_count method that returns an integer value for the number of matches
- write a :match_indices method that returns an array of integers, indicating indices where matches in the string occur

### Requirements

gem install rspec

### Pseudocode

I. Write a method solely dedicated to generating a list of matches through recursion<br/>
II. Add the class methods :match?, :match_count, and :match_indices to String. Each method should reference the method used to generate the list of matches.<br/>
III. Raise an exception error if the argument passed in for each method is not a valid type<br/>

###Solution

To recursively generate a list of matches, the original string was sliced from the 0 index to the length of the substring. The slice was then compared to the substring.
If the two matched, the slice was then collected in a hash, along with the index at which the match occurred in the original string. This process was done until
the original string was sliced down to a length of 1, at which point the method was terminated and the list of matches was returned. The implementation to generate the list of matches
was kept private, so that objects and methods outside the class would not have access, since, on an interface level, it's only necessary to determine if there is a match, the match count,
and where the matches occurred. The method for generating the list was called :generate_matches.


The methods :match?, :match_count, and :match_indices all reference :generate_matches and interact with generated list to give each desired return. A spec was created to
test assumptions and validity. To run the spec, enter the following in the terminal:

rspec string_match_without_scan_or_regex_spec.rb


