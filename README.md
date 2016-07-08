# Matching Without Scan or Regex

### Objective

Without using :scan or RegEx perform the following:

- write a :match? method that returns true or false if a target object is found within a candidate object
- write a :match_count method that returns an integer value for the number of matches
- write a :match_indices method that returns an array of integers, indicating indices where matches in the candidate object occur

<b>Note:</b>

Initially, the purpose of this exercise was to write a match method for string objects. However, it has been extended to be a match for several data types.

### Requirements

gem install rspec

### Pseudocode

I. Create a Matcher class
II. Write a method solely dedicated to generating a list of matches through recursion<br/>
III. Add the class methods :match?, :match_count, and :match_indices to Matcher<br/>
    - Each method should reference the method used to generate the list of matches.<br/>
    - the matching methods should accommodate a range of data types

###Solution



The methods :match?, :match_count, and :match_indices all reference :generate_matches and interact with generated list to give each desired return. A spec was created to
test assumptions and validity. To run the spec, enter the following in the terminal:

rspec string_match_without_scan_or_regex_spec.rb


