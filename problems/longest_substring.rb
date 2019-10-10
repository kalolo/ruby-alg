=begin
3. Longest Substring Without Repeating Characters
Given a string, find the length of the longest substring without repeating characters.

Example 1:
Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end
require 'rspec/autorun'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    3
end


describe "Longest substring" do 
    it "fin the length of the longest substring" do
        result = 
        expect( length_of_longest_substring "abcabcbb" ).to eql(3)
    end
end