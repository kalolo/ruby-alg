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

    return 0 if s.nil? || s.length <= 0
    return 1 if s.length == 1

    h = {}
    start_point = 0
    max = 0
    data = s.split("")

    data.each_with_index do |c, i|
        p "#{c} - #{i} has: #{h.key? c} :: #{start_point} #{max}"
        if !h.key? c
           h[c] = i
        else
            diff = i - start_point
            start_point = h[c] + 1
            max = diff if diff > max
            h[c] = i
        end
    end
    max
end

describe "Given a string, find the length of the longest substring without repeating characters." do 
    it "abcabcbb => 3" do
      expect( length_of_longest_substring "abcabcbb" ).to eql(3)
    end

    it "bbbbb => 1" do
      expect( length_of_longest_substring "bbbbb" ).to eql(1)
    end

    it "pwwkew => 3" do
      expect( length_of_longest_substring "pwwkew" ).to eql(3)
    end

    it "\" \" => 1" do
      expect( length_of_longest_substring " " ).to eql(1)
    end

    it "\"\" => 1" do
      expect( length_of_longest_substring "" ).to eql(0)
    end

    it "au => 1" do
      expect( length_of_longest_substring "au" ).to eql(2)
    end

    it "dvdf => 1" do
       expect( length_of_longest_substring "dvdf" ).to eql(3)
    end
end