# Matching Without Scan or Regex

### Objective

Without using :scan or RegEx perform the following:

- write a :match? method that returns true or false if a target object is found within a candidate object
- write a :match_count method that returns an integer value for the number of matches
- write a :match_indices method that returns an array of integers, indicating indices where matches in the candidate object occur

<b>Note:</b><br />

Initially, the purpose of this exercise was to write a match method for string objects. It has been extended to be a match for several data types, such
as array, integer, or hash. However, the implementation within

### Requirements

gem install rspec

### Pseudocode

I. Create a Matcher class
II. Write a method solely dedicated to generating a list of matches through recursion<br/>
III. Add the class methods :match?, :match_count, and :match_indices to Matcher<br/>
    - Each method should reference the method used to generate the list of matches.<br/>
    - the matching methods should accommodate a range of data types

###Solution

A recursive method was written to generate an array of matches (:generate_matches). Since objects outside the Matcher class are only interfacing with :match?, :match_count, and :match_indices, :generate_matches was made private
to obscure its implementation and allow updates without necessarily affecting the public methods. All candidate objects and target objects passed to :generate_matches
were converted to string objects; hence why the public methods can accommodate multiple data types. Inside the recursive call, it checked if the candidate object started with the target. If so,
the target was collected in an array; if not, nil was collected in the array as a representation of no match. With each recursive call the candidate object was sliced, removing the first character each time.
The call was only terminated once the candidate object was passed in as an empty string, consequently returning the array of matches.


The methods :match?, :match_count, and :match_indices all reference :generate_matches and interact with the generated list to give their respective desired returns. A spec was created to
test assumptions and validity. To run the spec, enter the following in the terminal:

rspec string_match_without_scan_or_regex_spec.rb

<b>Note:</b><br />

The solution starts to break down around mixed data types. For instance, ["1"] will return a match for 1, even though "1" and 1 are not equivalent. Hence, I'd qualify this
solution as more of a "character" matcher than a true match. As I continue to refactor my solution, type comparisons will be factored in.